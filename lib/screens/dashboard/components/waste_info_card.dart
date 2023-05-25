// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/Mywaste.dart';
import 'package:untitled/screens/dashboard/components/add_new.dart';

class wasteInfoCard  extends StatelessWidget{
  const wasteInfoCard ({
    Key? key,
    required this.info,

  }): super (key: key);
  final CloudstorageInfo info ;
  @override
  Widget build(BuildContext context){
    return  Container(
      //padding: EdgeInsets.all(50),
      //padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),

      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(info.svgSrc ,
            ),
          ),
          Text(info.title, maxLines: 1, overflow:  TextOverflow.ellipsis,style: TextStyle(fontSize: 20),),
          SizedBox(height: 5,)
        ],
      ),
    );
  }

}

