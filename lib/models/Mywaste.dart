// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class CloudstorageInfo {
  String svgSrc, title, description;

  int quantity, percentage;
  final Color color;


  CloudstorageInfo(
      {required this.svgSrc,
      required this.description,
      required this.color,
      required this.title,
      required this.quantity,
      required this.percentage});

  String get getDescription{
    return description;
  }
  void setDescription(description){
    this.description = description;
  }

  String get getTitle{
    return title;
  }
  void setTitle(title){
    this.title = title;
  }

  String get getSvgSrc{
    return svgSrc;
  }
  void setSvgSrc(svgSrc){
    this.svgSrc = svgSrc;
  }

  int get getQuantity{
    return quantity;
  }
  void setQuantity(int quantity){
    this.quantity = quantity;
  }
  int get getPercentage{
    return percentage;
  }
  void setPercentage(int percentage){
    this.percentage = percentage;
  }




}


List demoMywaste = [
  CloudstorageInfo(
    description: " A 500 Millimiter Bottle / 3oz C02",
    title: "plastic",
    quantity: 000,
    svgSrc: 'assets/images/plastic1.jpg',
    color: primaryColor,
    percentage: 30,
  ),
  CloudstorageInfo(
    description: "",
    title: "paper",
    quantity: 000,
    svgSrc: "assets/images/cardboard.jpg.6a687a6e.jpg",
    color: Colors.yellow,
    percentage: 10,
  ),
  CloudstorageInfo(
    description: "",
    title: "batteries",
    quantity: 000,
    svgSrc: "assets/images/0_pFGH46zEA5ddgohb.jpg",
    color: Colors.red,
    percentage: 10,
  ),
  CloudstorageInfo(
    description: "",
    title: "organic",
    quantity: 000,
    svgSrc: "assets/images/Calgary-Organic-Recycling-Green-Bins.jpg",
    color: Colors.cyan,
    percentage: 10,
  ),
];
