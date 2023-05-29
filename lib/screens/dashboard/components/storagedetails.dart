// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:untitled/models/Recentwaste.dart';
import 'package:untitled/screens/dashboard/components/chart.dart';

import '../../../constants.dart';
import '../../../models/Mywaste.dart';
import 'StorageInfoCard.dart';


class storagedetails extends StatefulWidget{
  const storagedetails({
    Key ? key,
  }) :super(key: key);

  @override
  State<storagedetails> createState() => _storagedetailsState();
}

class _storagedetailsState extends State<storagedetails> {
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(defaultPadding),

      decoration: const BoxDecoration(color: secondaryColor,borderRadius: BorderRadius.all(Radius.circular(10),
      ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("waste / carbon footprint",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, ),
          ),
          SizedBox(height: defaultPadding,),
          Chart(info: demoMywaste),
          StorageInfoCard(
            unit: " bottles",info: demoMywaste[0],color:Color(0xFF26E5FF),
          ),
          StorageInfoCard(
            unit:" papers",info: demoMywaste[1],color:Color(0xFFFFCF26)
          ),
          StorageInfoCard(
            unit:" batteries",info: demoMywaste[2],color: Color(0xFFEE2727),
          ),
          StorageInfoCard(
            unit:" kg",info: demoMywaste[3], color: primaryColor,
          ),
        ],
      ),
    );
  }
}