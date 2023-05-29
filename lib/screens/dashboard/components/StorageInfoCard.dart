// ignore_for_file: prefer_const_constructors, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/Recentwaste.dart';
//import 'package:flutter_svg/flutter_svg.dart';


import '../../../constants.dart';
import '../../../models/Mywaste.dart';

class StorageInfoCard extends StatefulWidget{
  final  CloudstorageInfo info ;
  final Color color;

  final String unit;
  const StorageInfoCard ({
    Key? key ,
    required this.unit,
    required this.info, required this.color,



  }) : super(key: key);

  @override
  State<StorageInfoCard> createState() => _StorageInfoCardState();
}

class _StorageInfoCardState extends State<StorageInfoCard> {
  Future getData() async {
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
        int currentquantity = data[widget.info.title]['currentQuantity'];
        setState(() {
          widget.info.setQuantity(currentquantity);
        });
      }
    }
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: defaultPadding) ,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          border: Border.all(
              width:2,
              color: primaryColor.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(Radius.circular(defaultPadding),)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 50, width: 50,
          child: //SvgPicture.asset(svgSrc),
             Image.asset(widget.info.svgSrc,
           ),
          ),
          const SizedBox(width: 40,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ Text(widget.info.title,
                  style: TextStyle(color: widget.color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                  Text("${widget.info.getQuantity}"+widget.unit,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),)

                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
