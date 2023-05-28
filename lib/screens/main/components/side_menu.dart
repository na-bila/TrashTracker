// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/auth_system/tabbar_screen.dart';
import 'package:untitled/home_screen.dart';

import '../../../localisation.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
  Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    child: Column(
      children: [
        SizedBox(
          height: 180,
          child: Image.asset(
            "assets/images/zero-waste_logo_no-text-01.png",
          ),
        ),
      ],
    )
  );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap (
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () =>
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen())),
        ),
        const Divider(color: Colors.black54),
        ListTile(
          leading: const Icon(Icons.share_location),
          title: const Text('Tracking'),
          onTap: () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Localisation())),
        ),
        const Divider(color: Colors.black54),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
            onTap: ()async{
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>TabbarScreen()));
            },
        ),
      ]
  )
  );
}



          