import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pharma_mvc/controller/cart_controller.dart';
import 'package:pharma_mvc/view/widget/faild.dart';

class Cart extends StatelessWidget {
 
 controller_cart controller =Get.put(controller_cart());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.green[700],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Obx(() {
               if (controller.total.isNotEmpty) {
           return
                Text(
                             "Total Price : " r"$" "${controller.total.toString()}" ,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                     }
         else{
        return  Center(child: CircularProgressIndicator(),);
       }}
         ,)  ,                       
                  
                  Container(
                      child: MaterialButton(
                    onPressed: ()async {
                    await controller.addorder();
                    },
                    child: Text(
                      "40".tr,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.green.shade700,
                  )),
                ],
              )
            ])),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.green[700],
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("41".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23)),
                    Container(
                      width: 70,
                      child: Stack(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 35,
                              )),
       Positioned(
                              right: 10,
                              child: CircleAvatar(
                              radius: 12,
                               backgroundColor: Colors.red,
                            child: 
          Obx(() {
        if (controller.medicine.isNotEmpty) {
           return
        
                       Text("${controller.medicine.length}");
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
                         const EdgeInsets.symmetric(horizontal:20,vertical: 20),
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                
                      Obx(() {
        if (controller.medicine.isNotEmpty) {
          
           return
       ListView.builder(
         itemCount: controller.medicine.length,
         itemBuilder: (context, index) =>   Container(
                              alignment: Alignment.center,
                              height: 125,
                              margin: const EdgeInsets.symmetric(vertical: 20,
                               horizontal: 20),
                              padding: EdgeInsets.only(top: 10,right:10,left: 10),
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
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.network(
                                        controller.medicine[index].image.toString()),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5,vertical: 13),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                       // To add Title 
                                        Column(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                       controller.medicine[index].commercialName.toString()   ,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade900),
                                            ),
                                          SizedBox(height: 5,),
                                  
                                       Text(
                                  "price: \$ ${controller.medicine[index].price.toString()}",
                                     style: TextStyle(
                                     fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                           color: Colors.grey.shade600),
                ),
                SizedBox(height: 2,),
                                                     Row(mainAxisAlignment: MainAxisAlignment.end,
                                                       children: [
                                                         Row(
                                                           children: [ SizedBox(width: 7,),
                                                            Text("42".tr, style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600)),
                                                  SizedBox(width: 7,),
             Obx(() {
        if (controller.quantity1.isNotEmpty) {
           return
          
                            Text(
                                              controller.quantity1[index].toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600),
                                            );
                                               }
         else{
        return  Center(child: CircularProgressIndicator(),);
       }}
         ,)  ,
                                                              ],
                                                         ),
                                InkWell(onTap: (){
                             
                    Get.defaultDialog
                    (buttonColor: Colors.green.shade700,textCancel: "21".tr,onCancel: (){},
                    textConfirm: "9".tr,onConfirm: () async{
                      if(controller.quantity.text.isEmpty||controller.quantity.text.length>4){}
                            else{   
                              await controller.updatecart( id: controller.medicine[index].id, quantity:controller.quantity.text,);
                             Get.back();
                            }
                              },
                confirmTextColor:Colors.white ,
                cancelTextColor:Colors.black ,
              
                    
                        middleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),
                          title:'43'.tr,
                           content: filed(k: TextInputType.number,
                            th: "44".tr, controll:controller.quantity , osb:false, vaild:(Value) {
                             if(Value!.isNotEmpty&&Value.length>4)

                             return "45".tr ;},
                           ),
                          titleStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold));

                                            },
                                            child:Icon(Icons.create,size:16,color: Colors.green,))
                                                       ],
                                                     ),
                                          ],
                                        ),
                                Obx(() {
        if (controller.totalprice.isNotEmpty) {
           return
           
                                       
                                       Text(
                                  "price total: \$ ${controller.totalprice[index].toString()}",
                                     style: TextStyle(
                                     fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                           color: Colors.grey.shade600),);
                                                  }
         else{
        return  Center(child: CircularProgressIndicator(),);
       }}
         ,)  ,
                                      ],
                                    ),
                                  ),

                                  Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                           controller. delete( id:controller.medicine[index].id );
                                          
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.green,
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
