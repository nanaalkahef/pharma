import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharma_mvc/controller/homepage_controller.dart';
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/model/prodected2.dart';

class descriptionproduect extends StatelessWidget {
  final Medicines medicines;

  var to = shardpre!.getString('token');

  descriptionproduect({super.key, required this.medicines});
  controller_homepage controll = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "29".tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green[700],
            )),
      ),
      backgroundColor: Colors.green[700],
      body: Column(
        children: [
          Center(
            child: Container(
              height: 450,
              width: double.infinity,
              padding: EdgeInsets.only(top: 50, left: 50, right: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                        width: 250,
                        height: 250,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add_shopping_cart)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.heart_broken_outlined)),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.80,
                                height:
                                    MediaQuery.of(context).size.height * 0.80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          spreadRadius: 5)
                                    ],
                                    shape: BoxShape.circle),
                              ),
                              Image.network(
                                medicines.image.toString(),
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    medicines.commercialName.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    medicines.categoryName.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Price :${medicines.price}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      )),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      "31".tr,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      medicines.scientificName.toString(),
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "32".tr,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      medicines.manufactureCompany.toString(),
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "33".tr,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      medicines.quantity.toString(),
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: FittedBox(
                          child: MaterialButton(
                        onPressed: () {
                          Get.snackbar("product Added",
                              "you have added the ${medicines.commercialName}to the favorite",
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 1));
                          controll.addfavorite(id: medicines.id);
                        },
                        child: Row(
                          children: [
                            Text("34".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.favorite,
                              size: 25,
                              color: Colors.red,
                            )
                          ],
                        ),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: FittedBox(
                          child: MaterialButton(
                        onPressed: () {
                          Get.snackbar("product Added",
                              "you have added the ${medicines.commercialName}to the cart",
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 1));
                          controll.addcart(id: medicines.id);
                        },
                        child: Row(
                          children: [
                            Text(
                              "35".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.add_shopping_cart,
                              size: 25,
                              color: Colors.green[700],
                            )
                          ],
                        ),
                      )),
                    )
                  ],
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
          ),
        ],
      ),
    );
  }
}
