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
              QuantityInput(
                value: simpleIntInput,
                onChanged: (value) => setState(
                      () => simpleIntInput = int.parse(value.replaceAll(',', '')),
                ),
              ),
              Text(
                'Value: $simpleIntInput',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),

              Column(
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

        ],
      ),
      ),
      ),
    );
  }
}
