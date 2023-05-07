// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
 class CloudstorageInfo {
   final String svgSrc , title ;
   final int quantity , percentage;
   final Color color ;

   CloudstorageInfo(
   {
     required this.svgSrc,
     required this.color,
     required this.title,

    required this.quantity,
     required this.percentage

   }
       );
 }
 List demoMywaste = [
   CloudstorageInfo(
     title: "plastic",
     quantity: 000,
     svgSrc: 'assets/images/plastic1.jpg',
     color: primaryColor,
     percentage: 30 ,
   ),
   CloudstorageInfo(
     title: "paper and carboard",
     quantity: 000,
     svgSrc: "assets/images/cardboard.jpg.6a687a6e.jpg",
     color: Colors.yellow,
     percentage: 10 ,
   ),
   CloudstorageInfo(
     title: "batteries",
     quantity: 000,
     svgSrc: "assets/images/0_pFGH46zEA5ddgohb.jpg",
     color: Colors.red,
     percentage: 10 ,
   ),
   CloudstorageInfo(
     title: "organic waste",
     quantity: 000,
     svgSrc: "assets/images/Calgary-Organic-Recycling-Green-Bins.jpg",
     color: Colors.cyan,
     percentage: 10 ,
   ),
 ];