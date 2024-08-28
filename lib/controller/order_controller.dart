import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/model/prodected2.dart';


class controller_order extends GetxController {
   var to = shardpre!.getString('token');
  RxList<order1> order = <order1>[].obs;
getorder()async{

 final response =await http.get(Uri.parse('http://192.168.43.80:8000/api/order/index'),
 headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $to'});
  
if(response.statusCode==200){

var data=jsonDecode(response.body);
print(data);
  var s=  data["data"];
   print(s);
 order.clear();
 for(int i=0;i<s.length;i++){
 order.add(order1.fromJson(s[i]) );

}
}

else{
  throw Exception('there is problem in ${response.statusCode}');
}


}

}