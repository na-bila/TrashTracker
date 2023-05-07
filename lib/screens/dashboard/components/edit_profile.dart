
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/dashboard/components/edit_password.dart';
import 'package:untitled/screens/dashboard/components/profile.dart';

class  editprofile extends StatelessWidget{
  Widget textfield({@required hintText,  }) {
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
      body: SingleChildScrollView(

        child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [



                Container(
                  height: 600,
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

                      Text('address:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: bgColor, ),
                      ),
                      textfield(

                        hintText: 'address',

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Center(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  profile(),
                                  ),
                                );
                              },

                              color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.save,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "save ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  editpassword(),
                                  ),
                                );
                              },

                              color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "edit Password",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                         ],
                     ),
              ],
            ),
          ),
        ],
      ),
    ),

      ),
    );
  }
}




