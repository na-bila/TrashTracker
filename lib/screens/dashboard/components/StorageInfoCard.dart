// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';


import '../../../constants.dart';

class StorageInfoCard extends StatefulWidget{
  const StorageInfoCard ({
    Key? key ,
    required this.title,
    required this.svgSrc,
    required this.quantity,



  }) : super(key: key);
  final String title, svgSrc ;
  final int quantity;

  @override
  State<StorageInfoCard> createState() => _StorageInfoCardState();
}

class _StorageInfoCardState extends State<StorageInfoCard> {
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
             Image.asset(widget.svgSrc,
           ),
          ),
          const SizedBox(width: 40,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ Text(widget.title, maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                  Text("${widget.quantity} waste",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),)

                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
