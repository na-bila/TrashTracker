// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/auth_system/services/auth_page.dart';
import 'package:untitled/auth_system/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 1));
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthPage())));
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              Image(
                image: AssetImage("assets/images/zero-waste_logo_no-text-01.png"),
                width: 300,
              ),
              SizedBox(
                height: 50,
              ),
              SpinKitSpinningLines(
                  color: Colors.red,
              size: 50.0,
              )
            ],
          )
          )
      );
    }
  }
