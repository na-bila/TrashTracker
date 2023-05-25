// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:untitled/models/Mywaste.dart';

import '../../../controllers/tap_controller.dart';
import 'package:get/get.dart';
class AddNewScreen extends StatelessWidget  {
  final CloudstorageInfo info ;

  const AddNewScreen({Key? key, required this.info}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.find<TapController>().initProduct();
    TapController tapController= Get.put(TapController());
    // Utilisez les informations passées en paramètres
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New"),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(info.svgSrc),
                fit: BoxFit.cover
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(0,-4),
                    blurRadius: 8
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top:20,
                      right:30,
                      left:30
                    ),
                    child: Row(
                      children: [
                        Text(info.title,
                          style: GoogleFonts.ptSans(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        top:20,
                        left: 20,
                        right:20
                      ),
                    child: Row(
                      children: [
                        Text(info.description,
                        style: GoogleFonts.ptSans(
                          fontSize: 15,
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            tapController.setQuantity(false);
                          },
                          child: Container(
                            height: 49, width: 49,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(243, 175, 45, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text("-",
                              style: GoogleFonts.ptSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),)
                            )
                          ),
                        ),
                        GetBuilder<TapController>(builder: (tapController){
                          return Container(
                              height:49,
                              width: 100,
                              child: Center(
                                  child: Text(tapController.quantity.toString(),
                                      style: GoogleFonts.ptSans(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )
                                  )
                              ),
                          );
                        }),
                        GestureDetector(
                          onTap: (){
                            tapController.setQuantity(true);
                          },
                          child: Container(
                              height: 49, width: 49,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 175, 45, 1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                  child: Text("+",
                                    style: GoogleFonts.ptSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),)
                              )
                          ),
                        )
                      ]
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),

    topLeft: Radius.circular(20),

    ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.07),
                            offset: Offset(0, -3),
                            blurRadius: 12
                          )
                        ]
                  ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total',
                              style:GoogleFonts.ptSans(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              ),
                              Text('',
                              style:GoogleFonts.ptSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              )

                            ],
                          ),
                        ),
                        Material(
                          color: Color.fromRGBO(243, 175, 45, 1),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical:10,horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 175, 45, 1),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text('Recycled',
                              style: GoogleFonts.ptSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ]
      ),
    );
  }
}