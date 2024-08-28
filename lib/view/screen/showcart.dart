import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_mvc/controller/cart_controller.dart';
import 'package:pharma_mvc/model/prodected2.dart';


class Showcart extends StatelessWidget {
  order1 order;
  Showcart({super.key, required this.order});

  controller_cart controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.showcart(id: order.id);
    controller.getquantityshow(id: order.id);
    return Scaffold(
        backgroundColor: Colors.green[700],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green[700],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("My Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
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
                            child: Obx(
                              () {
                                if (controller.showcartt.isNotEmpty) {
                                  return Text("${controller.showcartt.length}");
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )))
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
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 190,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
              Obx(
                () {
                  if (controller.showcartt.isNotEmpty) {
                    return ListView.builder(
                        itemCount: controller.showcartt.length,
                        itemBuilder: (context, index) => Container(
                            alignment: Alignment.center,
                            height: 116,
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
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
                                ]),
                            child: Row(
                              children: [
                                //To Add image
                                Container(
                                  height: 90,
                                  width: 90,
                                  margin: EdgeInsets.only(right: 10),
                                  child: Image.network(controller
                                      .showcartt[index].image
                                      .toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 13),
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
                                            controller
                                                .showcartt[index].commercialName
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade900),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("Quantity :",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .grey.shade600)),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Obx(
                                                () {
                                                  if (controller
                                                      .requriedquantity
                                                      .isNotEmpty) {
                                                    return Text(
                                                      controller
                                                          .requriedquantity[
                                                              index]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .grey.shade600),
                                                    );
                                                  } else {
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ]),
          ),
        ]));
  }
}
