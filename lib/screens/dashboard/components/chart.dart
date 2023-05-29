import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/Mywaste.dart';

import '../../../constants.dart';

class Chart extends StatefulWidget{
  final List<dynamic> info;
  const Chart({
    Key ? key, required this.info ,
  }) : super(key: key) ;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  Future getData(int i) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'users').doc(firebaseUser?.uid)
        .collection("trash").limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      // retrieve the first document
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      String documentId = documentSnapshot.id;
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser?.uid)
          .collection('trash')
          .doc(documentId).get();
      Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
      if (data != null) {
        int currentquantity = data[widget.info[i].title]['currentQuantity'];
        setState(() {
          widget.info[i].setQuantity(currentquantity);
        });
      }
    }
  }

  @override
  void initState() {
    for (int i = 0; i <4;i++){
      getData(i);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    double footprintQuantity= (widget.info[0].getQuantity)*0.082 + (widget.info[1].getQuantity)*150+(widget.info[3].getQuantity)*1;
    return SizedBox(
      height :350,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 4,
              centerSpaceRadius: 80,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height:  defaultPadding,),
              Text(footprintQuantity.toString(),style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500 ,
                  height: 0.5),
              ),
            ],
          ),
          ),
        ],

      ),
    );
  }
}
List<PieChartSectionData> paiChartSelectionDatas  = [
  PieChartSectionData(
      color: const Color(0xFF26E5FF),
      showTitle: false,
      radius: 22 ,
      value: 20),
  PieChartSectionData(
      color: const Color(0xFFFFCF26),
      showTitle: false,
      radius: 19  ,
      value: 10),
  PieChartSectionData(
      color: const Color(0xFFEE2727),
      showTitle: false,
      radius: 16 ,
      value: 15),
  PieChartSectionData(
      color:primaryColor,
      showTitle: false,
      radius: 13 ,
      value: 25),];

