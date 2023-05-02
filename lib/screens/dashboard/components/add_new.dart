// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/login_screen.dart';
class addnew extends  StatelessWidget {
  const addnew({
    Key ? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: const Text("Zero Waste ", style: TextStyle(
        color: Colors.red,
          ),),
         backgroundColor: bgColor,
         ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                  width:2,
                  color: primaryColor.withOpacity(0.15)),
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(

                      padding: const EdgeInsets.all(20),
                      child: Align(alignment: Alignment.topLeft,
                        child: Text(
                          'plastic:',
                          style: Theme.of(context).textTheme.titleLarge,

                        ),
                      ),

                    ),
                  ),
                        SizedBox(
                          width: 250, // ajustez la largeur du champ de texte selon vos besoins
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number, // pour afficher le clavier numérique
                              decoration: InputDecoration(
                                hintText: 'Quantity',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),

                      ],
                ),
          ),
          ),
          ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width:2,
                          color: primaryColor.withOpacity(0.15)),
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Expanded(
                        child: Padding(

                      padding: const EdgeInsets.all(20),
                      child: Align(alignment: Alignment.topLeft,
                        child: Text(
                          'paper:',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),

                        ),
                        ),
                          SizedBox(
                            width: 250, // ajustez la largeur du champ de texte selon vos besoins
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number, // pour afficher le clavier numérique
                                decoration: InputDecoration(
                                  hintText: 'Quantity',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),

                        ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width:2,
                          color: primaryColor.withOpacity(0.15)),
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Expanded(
                        child: Padding(


                        padding: const EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'battery:',
                          style: Theme.of(context).textTheme.titleLarge,

                        ),
                      ),

                    ),
                  ),
                          SizedBox(
                            width: 250, // ajustez la largeur du champ de texte selon vos besoins
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number, // pour afficher le clavier numérique
                                decoration: InputDecoration(
                                  hintText: 'Quantity',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),

                        ],
                ),
                  ),
              ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width:2,
                          color: primaryColor.withOpacity(0.15)),
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    child: Row( mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Expanded(
                      child: Padding(

                        padding: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'organic:',
                            style: Theme.of(context).textTheme.titleLarge,

                          ),
                        ),
                      ),
                    ),
                        SizedBox(
                          width: 250, // ajustez la largeur du champ de texte selon vos besoins
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number, // pour afficher le clavier numérique
                              decoration: InputDecoration(
                                hintText: 'Quantity',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),

                ],)
                  ),
                ),
              ),
            ],
          ),
        ),








    );

  }
}