import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pharma_mvc/controller/local_controller.dart';
import 'package:pharma_mvc/help/local.dart';
import 'package:pharma_mvc/help/midle.dart';
import 'package:pharma_mvc/view/screen/homepage.dart';
import 'package:pharma_mvc/view/screen/login.dart';
import 'package:pharma_mvc/view/screen/registar.dart';
import 'package:pharma_mvc/view/screen/wellcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? shardpre;
var total;
void main() async{
WidgetsFlutterBinding.ensureInitialized();
shardpre=await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 MyLocaleController controller = Get.put(MyLocaleController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      locale: controller.intialLang,
      translations: MyLocale(),
      initialRoute: "/ho",
      getPages: [
      GetPage(name: "/h", page: () => home(),middlewares: [midl()]),
       GetPage(name: "/ho", page: () => HomePage(),),
      GetPage(name: "/", page: () => registar(),),
      GetPage(name: "/log", page: () => login())
    ],

    );}}
