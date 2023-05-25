// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:untitled/screens/dashboard/components/chart.dart';

import '../../../constants.dart';
import 'StorageInfoCard.dart';


class storagedetails extends StatelessWidget{
  const storagedetails({
    Key ? key,
  }) :super(key: key);
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
          Chart(),
          StorageInfoCard(
            title: "plastic", svgSrc: 'assets/images/plastic1.jpg', quantity: 2,
          ),
          StorageInfoCard(
            title: "paper", svgSrc: 'assets/images/cardboard.jpg.6a687a6e.jpg', quantity: 0,
          ),
          StorageInfoCard(
            title: "battery", svgSrc: 'assets/images/0_pFGH46zEA5ddgohb.jpg', quantity: 0,
          ),
          StorageInfoCard(
            title: "organic", svgSrc: 'assets/images/Calgary-Organic-Recycling-Green-Bins.jpg', quantity: 0,
          ),
        ],
      ),
    );
  }
}