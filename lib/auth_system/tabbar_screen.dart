import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/auth_system/registration_screen.dart';

import '../firebase_options.dart';
import 'login_screen.dart';
class TabbarScreen extends StatelessWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: const [
              const Icon(Icons.settings)
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.login),
                  text: "Sign IN",
                ),
                Tab(
                  icon: Icon(Icons.app_registration),
                  text: "Sign UP",
                 ),
              ]
            )
          ) ,
          body: TabBarView(
            children:[
              LoginScreen(),
              RegistrationScreen()

            ]
          )
        )
      )

    );
  }
}




