// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/Mywaste.dart';

import '../../../models/Recentwaste.dart';


class recentWaste extends StatefulWidget {

  const recentWaste({
    Key? key,
  }) : super (key: key);


  @override
  State<recentWaste> createState() => _recentWasteState();
}


class _recentWasteState extends State<recentWaste> {
  bool _isPageInitialized = false;

  late Recentwaste wasteinfo=demoRecentwaste[0];



  Future getData(Recentwaste wasteinfo) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'users').doc(firebaseUser?.uid)
        .collection("trash").limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      // retrieve the first document
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      String documentId = documentSnapshot.id;
      setState(() async {
        DocumentSnapshot document = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser?.uid)
            .collection('trash')
            .doc(documentId).get();
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
        if (data != null) {
          dynamic lastItem=data[wasteinfo.title]['records'][data[wasteinfo.title]['records'].length - 1];
          int lastQuantity = lastItem['quantity'];
          String lastDate= lastItem['date'];
          wasteinfo.setDate(lastDate);
          wasteinfo.setQuantity(lastQuantity);
          print("hiii");
          print(lastDate);

        }
      });
    };
  }

  @override
  void initState() {
    getData(wasteinfo);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10),)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(" Recent waste",
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(label: Text("type of waste "),),
                  DataColumn(label: Text("Date"),),
                  DataColumn(label: Text("Quantity"),),
                ],
                rows: List.generate(demoRecentwaste.length, (index) =>
                    recentWasteDataRow(demoRecentwaste[index]))
            ),
          ),
        ],
      ),
    );
  }


  DataRow recentWasteDataRow(Recentwaste wasteinfo) {
    getData(wasteinfo);
    return DataRow(cells: [
      DataCell(Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(wasteinfo.title),
          ),
        ],
      ),),
      DataCell(Text(wasteinfo.date)),
      DataCell(Text(wasteinfo.quantity.toString())),


    ],
    );
  }
}

