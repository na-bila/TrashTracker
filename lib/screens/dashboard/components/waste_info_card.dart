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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(info.svgSrc ,
            ),
          ),
          Text(info.title, maxLines: 1, overflow:  TextOverflow.ellipsis,style: TextStyle(fontSize: 20),),
          SizedBox(height: 5,),
          ProgressLine(color : info.color , percentage: info.percentage,),
          SizedBox(height: 5,),
          Text("${info.quantity} waste", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70), )
        ],
      ),
    );
  }

}
class ProgressLine  extends StatelessWidget{
  const ProgressLine ({
    Key ? key ,
    this.color = primaryColor,
    required this.percentage ,


  }) : super  ( key : key);
  final Color color;
  final  int percentage ;
  @override
  Widget build (BuildContext context){
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
        ),
        LayoutBuilder(builder: (context,constaints) =>  Container(
          width: constaints.maxWidth* (percentage/100),
          height: 5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
        ),),
      ],
    );
  }
}
