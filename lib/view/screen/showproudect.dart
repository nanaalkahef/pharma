import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_mvc/controller/homepage_controller.dart';
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/model/prodected2.dart';
import 'package:pharma_mvc/view/screen/description.dart';
import 'package:pharma_mvc/view/screen/login.dart';


class showproduect extends StatelessWidget {
  Category category;

  showproduect({super.key, required this.category});
  controller_homepage controll = Get.find();
  @override
  Widget build(BuildContext context) {
    controll.getgagecore(coryname: category.name);

    return Scaffold(
        backgroundColor: Colors.green[700],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green[700],
          title: Text(
            "${category.name}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: (() async {
                  shardpre!.clear();
                  Get.off(login());
                }),
                icon: Icon(Icons.menu))
          ],
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
                if (controll.gecore.isNotEmpty) {
                  return ListView.builder(
                      itemCount: controll.gecore.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                                 Get.off(descriptionproduect(medicines:controll.gecore[index],));
                            },
                            child: Stack(children: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  height: 166,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 25),
                                          blurRadius: 25,
                                          color: Colors.black12,
                                        )
                                      ])),
                              Container(
                                height: 150,
                                width: 175,
                                margin: EdgeInsets.only(
                                    left: 35, right: 0, top: 25, bottom: 10),
                                child: Image.network(
                                  controll.gecore[index].image.toString(),
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                              Container(
                                width: 355,
                                height: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      controll.gecore[index].commercialName
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      controll.gecore[index].categoryName
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "price ${controll.gecore[index].price}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[700]),
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ]))
        ]));
  }
}