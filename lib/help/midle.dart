import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_mvc/main.dart';


class midl extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var s = shardpre!.getString('token');

    print(s);
    if (shardpre!.getString('token') != null) return RouteSettings(name: "/ho");
  }
}
