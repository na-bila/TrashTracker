// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors



import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/login_screen.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp( GetMaterialApp(
    initialRoute: '/loginScreen',
    debugShowCheckedModeBanner: false,

    routes: {
      '/loginScreen':(context) => LoginScreen(),

    },
  ));
}