// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/material.dart';
import 'package:untitled/models/Mywaste.dart';
class AddNewScreen extends StatelessWidget {
  final CloudstorageInfo info ;

  const AddNewScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Utilisez les informations passées en paramètres
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(info.title),

          ],
        ),
      ),
    );
  }
}