

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pharma_mvc/controller/favourit_controller.dart';

class Favourite extends StatelessWidget {

controller_favourit controll = controller_favourit();
  




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              backgroundColor: Colors.green[700],
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.green[700],
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("37".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23)),
                    Container(
                      width: 70,
                      child: Stack(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                size: 35,
                              )),
       Positioned(
                              right: 10,
                              child: CircleAvatar(
                              radius: 12,
                               backgroundColor: Colors.red,
                            child: 
         Obx(() {
        if (controll.medicine.isNotEmpty) {
           return
                       Text("${controll.medicine.length}");
                         }
         else{
        return  Center(child: CircularProgressIndicator(),);
       }
       }
       ,)
                              )
                            )
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
              body: Column(children: [
                SizedBox(height: 20),
                Expanded(
                  child: Stack(children: [
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                   Obx(() {
        if (controll.medicine.isNotEmpty) {
           return ListView.builder(
         itemCount: controll.medicine.length,
         itemBuilder: (context, index) =>   Container(
                              alignment: Alignment.center,
                              height: 116,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                       boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 25),
                                          blurRadius: 25,
                                          color: Colors.black12,
                                        )
                                      ]
                                      ),
                              child: Row(
                                children: [
                                  //To Add image
                                  Container(
                                    height: 90,
                                    width: 90,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.network(
                                        controll.medicine[index].image.toString()),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5,vertical: 13),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
// To add Title 
                                        Column(
                                          children: [
                                            Text(
                                       controll.medicine[index].commercialName.toString()   ,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade900),
                                            ),
                                            SizedBox(height: 5,),
                                                     Text(
                                       controll.medicine[index].scientificName.toString()   ,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      
                                      ],
                                    ),
                                  ),

                                  Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                          controll.delete(id:controll.medicine[index].id );
                                       
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                ],
                              ))
                            );
      
       }
         else{
        return  Center(child: CircularProgressIndicator(),);
       }}
       ,)
                  ]),
                ),
              ]));
    }
}


