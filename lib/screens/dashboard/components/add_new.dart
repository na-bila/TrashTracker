// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/Mywaste.dart';

class AddNewScreen extends StatefulWidget {
  final CloudstorageInfo info;

  AddNewScreen({Key? key, required this.info}) : super(key: key);

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int simpleIntInput = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.info.title,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(widget.info.svgSrc),
              ),
              Text(
                "choose the number of bags:",
                style: TextStyle(fontSize: 20, color: Colors.white),

              ),
              SizedBox(
                height: 20,
              ),
              QuantityInput(
                value: simpleIntInput,
                onChanged: (value) => setState(
                      () => simpleIntInput = int.parse(value.replaceAll(',', '')),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'bag: $simpleIntInput',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Fonction à exécuter lorsque le bouton est pressé
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(10),
               
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

              SizedBox(
                height: 20,
              ),
            Container(
                padding: EdgeInsets.all(defaultPadding),

                decoration: const BoxDecoration(color: secondaryColor,borderRadius: BorderRadius.all(Radius.circular(10),
                ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("some information:" ),

                  Text(
                  widget.info.information,
                  style: TextStyle(
                    color: Colors.white,

                  ),
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
