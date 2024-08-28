

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharma_mvc/controller/local_controller.dart';
import 'package:pharma_mvc/controller/login_contrroler.dart';
import 'package:pharma_mvc/view/screen/wellcome.dart';
import 'package:pharma_mvc/view/widget/botton.dart';
import 'package:pharma_mvc/view/widget/faild.dart';

class login extends StatelessWidget {
  
  MyLocaleController controllerlang = Get.find();
  controller_login controll = Get.put(controller_login());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controll.laoding.value,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: (() {
                  Get.offAll(home());
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
                      bottom: 180, left: 45, right: 45, top: 280),
                  child: Center(
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned(
                          bottom: 170,
                          right: 10,
                          left: 10,
                          child: Image.asset("lib/images/logo.jpg",
                              width: 400, height: 400, fit: BoxFit.fill)),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "2".tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Text("3".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey)),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          filed(
                            th: "4".tr,
                            icon: Icon(Icons.phone),
                            controll: controll.phone,
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
                            osb: controll.eyes.value,
                            sufix: IconButton(
                              color: Colors.green[700],
                              icon: controll.eyes.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      size: 20,
                                    ),
                              onPressed: () {
                                controll.showeyes();
                              },
                            ),
                            k: TextInputType.visiblePassword,
                            controll: controll.password,
                            vaild: (Value) {},
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          botton(
                              tb: "2".tr,
                              tap: () async {
                                if (controll.password.text.isEmpty ||
                                    controll.phone.text.isEmpty) {
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

                              
                                } else if (!controll.phone.text
                                        .startsWith("09") ||
                                    controll.phone.text.length != 10) {
                                } else {
                                  controll.laoding.value = true;

                                  await controll.login(context);
                                  controll.laoding.value = false;
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
