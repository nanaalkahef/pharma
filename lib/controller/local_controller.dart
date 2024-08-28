import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharma_mvc/main.dart';


class MyLocaleController extends GetxController {
  Locale intialLang = shardpre!.getString("lang") == "ar" ? Locale("ar") :Locale("en");
  void changelang(String codelang) {
    Locale local = Locale(codelang);
    shardpre!.setString("lang", codelang);
    Get.updateLocale(local);
  }
}
