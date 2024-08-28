

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharma_mvc/controller/local_controller.dart';
import 'package:pharma_mvc/controller/register_controller.dart';
import 'package:pharma_mvc/view/widget/botton.dart';
import 'package:pharma_mvc/view/widget/faild.dart';




class registar extends StatelessWidget {
  MyLocaleController controllerlang = Get.find();
  controller_regista controller = Get.put(controller_regista());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.laoding.value,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.green[700],
                )),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 300, left: 45, right: 45, top: 260),
                  child: Center(
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned(
                          bottom: 250,
                          right: 10,
                          left: 10,
                          child: Image.asset(
                            "lib/images/logo.jpg",
                            width: 400,
                            height: 400,
                            fit: BoxFit.fill,
                          )),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "14".tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Text("15".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey)),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          filed(
                            th: "16".tr,
                            icon: Icon(Icons.person),
                            controll: controller.name,
                            osb: false,
                            vaild: (Value) {},
                            k: TextInputType.name,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          filed(
                            th: "4".tr,
                            icon: Icon(Icons.phone),
                            controll: controller.phone,
                            osb: false,
                            vaild: (Value) {
                              if (Value!.isNotEmpty &&
                                  (!Value.startsWith("09") ||
                                      Value.length != 10)) {
                                return "8".tr;
                              }
                            },
                            k: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          filed(
                            th: "5".tr,
                            icon: Icon(Icons.lock),
                            osb: controller.eyes.value,
                            sufix: IconButton(
                              color: Colors.green[700],
                              icon: controller.eyes.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      size: 20,
                                    ),
                              onPressed: () {
                                controller.showeyes();
                              },
                            ),
                            k: TextInputType.visiblePassword,
                            controll: controller.password,
                            vaild: (Value) {
                              if (Value!.isNotEmpty && Value.length < 5) {
                                return "17".tr;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          botton(
                              tb: "18".tr,
                              tap: () async {
                                if (controller.password.text.isEmpty ||
                                    controller.name.text.isEmpty ||
                                    controller.phone.text.isEmpty) {
                                  Get.defaultDialog(
                                      buttonColor: Colors.green.shade700,
                                      textConfirm: "9".tr,
                                      onConfirm: () => Navigator.pop(context),
                                      confirmTextColor: Colors.white,
                                      middleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      title: '10'.tr,
                                      middleText: '11'.tr,
                                      titleStyle: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold));
                                } else if (!controller.phone.text
                                        .startsWith("09") ||
                                    controller.phone.text.length != 10 ||
                                    controller.password.text.length < 5) {
                                } else {
                                  controller.laoding.value = true;

                                  await controller.registars(context);
                                  controller.laoding.value = false;
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    child: Text("0".tr),
                                    onTap: () {
                                      controllerlang.changelang("ar");
                                    },
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    child: Text("1".tr),
                                    onTap: () {
                                      controllerlang.changelang("en");
                                    },
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
