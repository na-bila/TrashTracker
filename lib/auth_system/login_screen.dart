// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';

import 'package:untitled/auth_system/registration_screen.dart';
import 'package:untitled/auth_system/services/auth_service_google.dart';
import 'package:untitled/auth_system/services/forgotPasswordPage.dart';
import 'package:untitled/auth_system/square_tile.dart';

import 'package:untitled/home_screen.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //text edition controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // sign user in method
  Future signUserIn() async{
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    //show loading circle
    showDialog(
      context: this.context,
      barrierDismissible: false,
      builder: (context){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
    //try sign in
    try{
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      //wrong email
      if (e.code == 'user-not-found'){
        wrongEmailMessage();
      }
      //wrong password
      else if(e.code == 'wrong-password'){
        wrongPasswordMessage();

      }
    }
    //pop loading circle
    Navigator.pop(this.context);
  }

  //wrong email message popup
  void wrongEmailMessage(){
    showDialog(
      context: this.context,
      builder: (context){
        return const AlertDialog(
          title: Text('Incorrrect Email'),
        );
    },
    );
  }

  //wrong passwor message popup
  void wrongPasswordMessage(){
    showDialog(
      context: this.context,
      builder: (context){
        return const AlertDialog(
          title: Text('Incorrrect Password'),
        );
    },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        child: Center(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(

          key: formKey,
          child: Column(
            children: [

              SizedBox(
                height: 130,
                child: Image.asset(
                  "assets/images/zero-waste_logo_no-text-01.png",
                ),
              ),

              //email textfield
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.email),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  label: const Text("Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                     email != null && !EmailValidator.validate(email)
                     ? 'Enter a valid email'
                     : null,
              ),
              const SizedBox(
                height: 30,
              ),

              //password textfield
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.password),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                value != null && value.length < 6
                    ? 'Enter min. 6 characters'
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return ForgotPasswordPage();
                      },
                      ),
                    );
                  },
                    child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        )

                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: signUserIn,
                color: Colors.red,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ),
              SizedBox(
                height: 20,
              ),
              //google sign in
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    onTap: () => AuthService().signinwith_google(),
                  ),
                ]
              ),
          ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        ),
      ),
      ),
    );
  }
}
