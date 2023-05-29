// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/Mywaste.dart';
import 'package:untitled/responsive.dart';
import 'package:untitled/screens/dashboard/components/add_new.dart';
import 'package:untitled/screens/dashboard/components/waste_info_card.dart';

class Mywaste extends StatelessWidget {
  const Mywaste({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

            Text(
              " Add Waste",


              style: TextStyle(color: Colors.white , fontWeight: FontWeight.w300, fontSize: 20  ),

            ),


        SizedBox(
          height: defaultPadding,
        ),
        Column(
          children: [
            InkWell(
              onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewScreen(info: demoMywaste[0]),
                ),
              );


              },
              child: wasteInfoCard(info: demoMywaste[0]),
            ),
            SizedBox(height: defaultPadding),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewScreen(info: demoMywaste[1]),
                  ),
                );
              },
              child: wasteInfoCard(info: demoMywaste[1]),
            ),
            SizedBox(height: defaultPadding),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewScreen(info: demoMywaste[2]),
                  ),
                );
                // Code à exécuter lorsque l'utilisateur appuie sur la carte
              },
              child: wasteInfoCard(info: demoMywaste[2]),
            ),
            SizedBox(height: defaultPadding),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewScreen(info: demoMywaste[3]),
                  ),
                );
                // Code à exécuter lorsque l'utilisateur appuie sur la carte
              },
              child: wasteInfoCard(info: demoMywaste[3]),
            ),

          ],
        ),
      ],
    );
  }
}
