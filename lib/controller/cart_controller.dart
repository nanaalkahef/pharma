import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/model/prodected2.dart';


class controller_cart extends GetxController {

  @override
  void onInit() {
    gettotal();
    getcart();
    gettotalprice();
    getquantity();
   

    super.onInit();
  }

  var to = shardpre!.getString('token');
  List total = [].obs;
  RxList<int> totalprice = <int>[].obs;
  RxList<int> quantity1 = <int>[].obs;
    RxList<int> requriedquantity = <int>[].obs;
  final TextEditingController quantity = new TextEditingController();
  RxList<Medicines> medicine = <Medicines>[].obs;
    RxList<Medicines> showcartt = <Medicines>[].obs;
  gettotalprice() async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/cart/show'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var s = data["data"]["cart"];
      totalprice.clear();
      for (int i = 0; i < s.length; i++) {
        totalprice.add((s[i]["total_price"]));
      }
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }

  getcart() async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/cart/show'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var s = data["data"]["cart"];

      medicine.clear();
      for (int i = 0; i < s.length; i++) {
        medicine.add(Medicines.fromJson(s[i]["medicine"]));
      }
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }

  gettotal() async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/cart/show'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      total = data["data"]["total"];

      ;
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }

  delete({required var id}) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.80:8000/api/cart/delete/$id'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      update();
    }
  }

  updatecart({required var id, required var quantity}) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.80:8000/api/cart/update/$id'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'},
        body: {"quantity": quantity});
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      update();
    }
  }

  addorder() async {
    final response = await http.post(
        Uri.parse('http://192.168.43.80:8000/api/order/store'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var s = data["message"];

      Get.defaultDialog(
          buttonColor: Colors.green.shade700,
          textConfirm: "9".tr,
          onConfirm: () async {
            Get.back();
          },
          confirmTextColor: Colors.white,
          middleTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          title: '38'.tr,
          middleText: '$s',
          titleStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
    }
  }

  getquantity() async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/cart/show'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var s = data["data"]["cart"];
      quantity1.clear();
      for (int i = 0; i < s.length; i++) {
        quantity1.add((s[i]["quantity"]));
      }
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }

showcart({required var id})async{

 final response =await http.get(Uri.parse('http://192.168.43.80:8000/api/order/show/$id'),

 headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $to'});

  
if(response.statusCode==200){

var data=jsonDecode(response.body);
  var s=data["data"]["the order"];

showcartt.clear();
 for(int i=0;i<s.length;i++){
 showcartt.add(Medicines.fromJson(s[i]["medicine"] )
 );

}
}

else{
  throw Exception('there is problem in ${response.statusCode}');
}


}

getquantityshow({required var id})async{

 final response =await http.get(Uri.parse('http://192.168.43.80:8000/api/order/show/$id'),

 headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $to'});

  
if(response.statusCode==200){

var data=jsonDecode(response.body);
  var s=data["data"]["the order"];
requriedquantity.clear();
 for(int i=0;i<s.length;i++){
 requriedquantity.add((s[i]["required_quantity"] )
 );

}

}

else{
  throw Exception('there is problem in ${response.statusCode}');
}


}







}

