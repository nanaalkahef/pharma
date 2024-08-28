import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/model/prodected2.dart';


class controller_favourit extends GetxController {
  @override
  void onInit() {
    getfav();
    super.onInit();
  }

  var to = shardpre!.getString('token');
  RxList<Medicines> medicine = <Medicines>[].obs;

  delete({required var id}) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.80:8000/api/lesson/delete/$id'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("yes");
    }
  }

  getfav() async {
    final response = await http.get(
        Uri.parse('http://192.168.43.80:8000/api/favourite/show'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $to'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var s = data["data"];
      medicine.clear();
      for (int i = 0; i < s.length; i++) {
        medicine.add(Medicines.fromJson(s[i]["medicine"]));
      }
    } else {
      throw Exception('there is problem in ${response.statusCode}');
    }
  }
}
