import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/auth_system/login_screen.dart';
import 'package:flutter/material.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController ();
  final displayNameController = TextEditingController();
  final adressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmedPasswordController.dispose();
    displayNameController.dispose();
    adressController.dispose();
    phoneNumberController.dispose();
    super.dispose();

  }
  // sign up users
  Future signUserUp() async{
    //show loading circle
    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
    // try creating the user
    try{
      // check if password is confirmed
      if (passwordController.text == confirmedPasswordController.text){
        //authenticate user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
        );
        //add user details
        addUserDetails(
          displayNameController.text.trim(),
          adressController.text.trim(),
          int.parse(phoneNumberController.text.toString()),
          emailController.text.trim(),

        );

      }else{
        // show error message password don't match
        showErrorMessage("Passwords don't match !");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //show error message
      showErrorMessage(e.code);
    }
    // pop the loading circle
    Navigator.pop(context);
  }
  //adduserdetails
  Future addUserDetails(String displayName,String city,int phone,String email) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(firebaseUser?.uid).set({
      'email': email,
      'displayName': displayName,
      'adress': city,
      'phoneNumber': phone,
    });
  }

  //error messsage to user
  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder:(context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
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
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Image.asset(
                  "assets/images/zero-waste_logo_no-text-01.png",
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //username
              TextFormField(
                controller: displayNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  //suffixIcon: const Icon(Icons.nam),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  label: const Text("Username"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: adressController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.location_city),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  label: const Text("Adress"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.phone),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  label: const Text("Phone"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.password),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: confirmedPasswordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.password),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  label: const Text("Confirm Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: signUserUp,
                color: Colors.red,
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
