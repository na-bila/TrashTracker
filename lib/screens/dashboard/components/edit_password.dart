
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/dashboard/components/profile.dart';

class  editpassword extends StatelessWidget{
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

                Container(
                  height: 450,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Text('Password:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: bgColor, ),
                      ),
                      textfield(

                        hintText: 'Password',
                      ),
                      Text('New password:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: bgColor, ),
                      ),
                      textfield(
                        hintText: 'New Password',
                      ),
                      Text('Confirm New password:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: bgColor, ),
                      ),
                      textfield(
                        hintText: 'Confirm New Password',
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




