// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/auth_system/login_screen.dart';
import 'package:untitled/splash_Screen.dart';

void main() {

  //WidgetsFlutterBinding.ensureInitialized();
  //WidgetFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/splashScreen',
    debugShowCheckedModeBanner: false,

    routes: {
      '/loginScreen':(context) => LoginScreen(),
      '/splashScreen':(context) => SplashScreen()

    },
  ));
}


