import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/view/screen/homepage.dart';


class controller_login extends GetxController {

  final TextEditingController phone = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  RxBool eyes = true.obs;
  RxBool laoding = false.obs;
  void showeyes() => eyes.value = !eyes.value;

  
  Future<void>  login (BuildContext context) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.80:8000/api/login'),
        body: {"phone": phone.text, "password": password.text});
    final data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      var apiToken = data['token'];
      print(apiToken);
      await shardpre!.setString('token', apiToken);
      Get.offAll(HomePage());
    } else if (response.statusCode == 422) {
      Get.defaultDialog(
          buttonColor: Colors.green.shade700,
          textConfirm: "9".tr,
          onConfirm: () => Get.back(),
          confirmTextColor: Colors.white,
          middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          title: '10'.tr,
          middleText: '11'.tr,
          titleStyle:
              TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
    } else if (response.statusCode == 401) {
      Get.defaultDialog(
          buttonColor: Colors.green.shade700,
          textConfirm: "9".tr,
          onConfirm: () => Get.back(),
          confirmTextColor: Colors.white,
          middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          title: '10'.tr,
          middleText: '12'.tr,
          titleStyle:
              TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
    }
  }
}
