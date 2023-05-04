


// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:untitled/screens/dashboard/components/edit_profile.dart';



import '../../../constants.dart';




class profile extends  StatelessWidget {
  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Zero Waste ", style: TextStyle(
          color: Colors.red,
        ),),
        backgroundColor: bgColor,
      ),
      body: Stack(
        alignment: Alignment.center,

        children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              height: 180,
              child: Image.asset(
                "assets/images/zero-waste_logo_no-text-01.png",
              ),
            ),

            Container(
              height: 450,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('username:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: bgColor, ),
                  ),
                  textfield(
                    hintText: 'Username',
                  ),
                  Text('Email:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: bgColor, ),
                  ),
                  textfield(
                    hintText: 'Email',
                  ),
                  Text('Password:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: bgColor, ),
                  ),
                  textfield(
                    hintText: 'Password',
                  ),
                  Text('address:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: bgColor, ),
                  ),
                  textfield(
                    hintText: 'address',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  editprofile()));

                      },
                      color: Colors.red,
                      child: const Text(
                        "edit infomation ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            )
          ],
      ),
        ),
      ],
    ),
    );
  }
}



