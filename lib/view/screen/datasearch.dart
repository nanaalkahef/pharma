import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_mvc/controller/homepage_controller.dart';
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/view/screen/description.dart';
import 'package:pharma_mvc/view/screen/searchca.dart';

class DataSearch extends SearchDelegate {
  controller_homepage controll = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear)),
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: categorySearch());
          },
          icon: Icon(Icons.search_sharp))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.green[700],
          size: 30,
          weight: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    var to = shardpre!.getString('token');
    if (query == "") {
      return Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "27".tr,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'lib/images/wibe.jpg',
            width: 300,
            height: 300,
          ),
        ],
      ));
    } else {
      return Obx(() {
        if (controll.medicine.isNotEmpty) {
          List fl = controll.medicine.where((element) {
            return element.commercialName
                    .toString()
                    .startsWith(query.toLowerCase()) ||
                element.categoryName
                    .toString()
                    .startsWith(query.toLowerCase()) ||
                element.commercialName
                    .toString()
                    .startsWith(query.toUpperCase()) ||
                element.categoryName.toString().startsWith(query.toUpperCase());
          }).toList();

          return ListView.builder(
              itemCount: fl.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.off(descriptionproduect(
                        medicines: fl[index],
                      ));
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
                          fl[index].image.toString(),
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
                              fl[index].commercialName.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              fl[index].categoryName.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "price ${fl[index].price}",
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
      });
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var to = shardpre!.getString('token');
    if (query == "") {
      return Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "27".tr,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'lib/images/wibe.jpg',
            width: 300,
            height: 300,
          ),
        ],
      ));
    } else {
      return Obx(() {
        if (controll.medicine.isNotEmpty) {
          List fl = controll.medicine.where((element) {
            return element.commercialName
                    .toString()
                    .startsWith(query.toLowerCase()) ||
                element.categoryName
                    .toString()
                    .startsWith(query.toLowerCase()) ||
                element.commercialName
                    .toString()
                    .startsWith(query.toUpperCase()) ||
                element.categoryName.toString().startsWith(query.toUpperCase());
          }).toList();

          print("////////////////////////////////////////");

          return ListView.builder(
              itemCount: fl.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.off(descriptionproduect(
                        medicines: fl[index],
                      ));
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
                          fl[index].image.toString(),
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
                              fl[index].commercialName.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              fl[index].categoryName.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "price ${fl[index].price}",
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
      });
    }
  }
}
