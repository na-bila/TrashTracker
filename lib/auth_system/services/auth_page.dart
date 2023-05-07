import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/auth_system/login_screen.dart';
import 'package:untitled/auth_system/tabbar_screen.dart';

import '../../home_screen.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData){
              return HomeScreen();
            }
            //user is not logged in
            else{
              return TabbarScreen();
            }
          }
        ),
    );
  }
}
