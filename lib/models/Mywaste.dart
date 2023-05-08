// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
 class CloudstorageInfo {
   final String svgSrc , title , information  ;
   final int quantity , percentage;
   final Color color ;


   CloudstorageInfo(
   {
     required this.svgSrc,
     required this.color,
     required this.title,
    required this.quantity,
     required this.percentage,
     required this.information
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
     information: 'Bottles are one of the most commonly recycled types of plastic. Plastic bottles are collected in recycling bins and taken to recycling centers where they are sorted by color, cleaned, and ground into small pieces. These pieces of plastic are then transformed into pellets that can be used to make new plastic products such as bottles, pipes, carpets, and clothing.'
      ' However, recycling plastic bottles also presents challenges, such as the need to collect and sort plastic bottles properly in order to recycle them effectively. Furthermore, contamination of plastic bottles can make recycling more difficult and result in lower-quality end products. That is why it is important to follow the recycling guidelines of your region and properly sort your waste to facilitate the recycling of plastic bottles.'
   ),
   CloudstorageInfo(
     title: "paper and carboard",
     quantity: 000,
     svgSrc: "assets/images/cardboard.jpg.6a687a6e.jpg",
     color: Colors.yellow,
     percentage: 10 ,
     information: 'saber'
   ),
   CloudstorageInfo(
     title: "batteries",
     quantity: 000,
     svgSrc: "assets/images/0_pFGH46zEA5ddgohb.jpg",
     color: Colors.red,
     percentage: 10 ,
     information: 'bnjr'
   ),
   CloudstorageInfo(
     title: "organic waste",
     quantity: 000,
     svgSrc: "assets/images/Calgary-Organic-Recycling-Green-Bins.jpg",
     color: Colors.cyan,
     percentage: 10 ,
     information: 'sabeur'
   ),
 ];