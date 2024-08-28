
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_mvc/controller/order_controller.dart';
import 'package:pharma_mvc/view/screen/showcart.dart';


class order extends StatelessWidget {
 
  controller_order controll = controller_order();

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
                    Text("46".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23)),
                    Container(
                      width: 70,
                      child: Stack(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_bag,
                                size: 35,
                              )),
       Positioned(
                              right: 10,
                              child: CircleAvatar(
                              radius: 12,
                               backgroundColor: Colors.red,
                            child: 
                              
         Obx(() {
        if (controll.order.isNotEmpty) {
           return
      
                       Text("${controll.order..length}");
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
        if (controll.order.isNotEmpty) {
           
           return ListView.builder(
         itemCount: controll.order.length,
         itemBuilder: (context, index) =>  InkWell(onTap: ()async {
                
                       Get.to( Showcart( order: controll.order[index]));
         },
           child: Container(
                                alignment: Alignment.center,
                                height: 125,
                                margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                   
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
                                      child:  Image.asset("lib/images/cart.jpg"),
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
         //                                     To add Title 
                                          Column(
                                            children: [
                                              Text(" Order Number  " r"" "${index+1}",
                                     
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey.shade900),
                                              ),
                                              SizedBox(height: 5,),
                                                       Text(
                                       " statues  :" r"" "${controll.order[index].status.toString()}"  ,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
         
                                                      SizedBox(height: 5,),
                                                       Text(
                                        " payment  : " r"" "${controll.order[index].payment.toString()}"   ,
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
         
                                  ],
                                )),
         )
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