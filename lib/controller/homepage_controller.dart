import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/model/prodected2.dart';


class controller_homepage extends GetxController {
  RxInt selectedindex = 0.obs;
  RxList<Category> category = <Category>[].obs;
  RxList<Medicines> medicine = <Medicines>[].obs;
  RxList<Medicines> gecore = <Medicines>[].obs;
  var listsearch = [];
  var to = shardpre!.getString('token');

  @override
  void onInit() {
 
    getallcater();
    getpro();
    super.onInit();
  }

  getgagecore({required var coryname}) async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/category/show/$coryname'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $to'
        });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      var s = data["data"]["medicines"];
      gecore.clear();
      for (int i = 0; i < s.length; i++) {
        gecore.add(Medicines.fromJson(s[i]));
      }
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }
    addfavorite({required var id})async{
      final response =await http.post(Uri.parse('http://192.168.43.80:8000/api/favourite/add/$id'),
   headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $to'}
      );
    final data=jsonDecode(response.body);

  
  
  }
    addcart({required var id})async{
  final response =await http.post(Uri.parse('http://192.168.43.80:8000/api/cart/store/$id'),
   headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $to'}
      );
  final data=jsonDecode(response.body);

  
  
  }


  getallcater() async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/category'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var s = data["data"];
      category.clear();
      for (int i = 0; i < s.length; i++) {
        category.add(Category.fromJson(s[i]));
      }
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }

  getpro() async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/medicine/'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      var s = data["data"];
      medicine.clear();
      for (int i = 0; i < s.length; i++) {
        medicine.add(Medicines.fromJson(s[i]));
      }
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }
}
