
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pharma_mvc/controller/homepage_controller.dart';
import 'package:pharma_mvc/controller/local_controller.dart';
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/view/screen/cart.dart';
import 'package:pharma_mvc/view/screen/datasearch.dart';
import 'package:pharma_mvc/view/screen/favourite%20(2).dart';
import 'package:pharma_mvc/view/screen/order.dart';
import 'package:pharma_mvc/view/screen/showproudect.dart';
import 'package:pharma_mvc/view/screen/wellcome.dart';


class HomePage extends StatelessWidget {

  MyLocaleController controllerlang = Get.find();
  controller_homepage controll = Get.put(controller_homepage()) ;

  List<Widget> widgetpages = [
    PageOne(),
    Favourite(),
    Cart(),
    order(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade200,
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                ListTile(
                  leading: Text(
                    "19".tr,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: Colors.grey.shade100,
                  child: ListTile(
                    iconColor: Colors.green.shade700,
                    leading: Icon(Icons.exit_to_app),
                    title: Text(
                      "20".tr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Get.defaultDialog(
                          buttonColor: Colors.green.shade700,
                          textCancel: "21".tr,
                          onCancel: () {},
                          textConfirm: "9".tr,
                          onConfirm: () async {
                            shardpre!.clear();
                            Get.off(home());
                          },
                          confirmTextColor: Colors.white,
                          cancelTextColor: Colors.black,
                          middleTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                          title: '22'.tr,
                          middleText: '23'.tr,
                          titleStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold));
                    },
                  ),
                ),
                Container(
                  color: Colors.grey.shade100,
                  child: ListTile(
                    iconColor: Colors.green.shade700,
                    leading: Icon(Icons.language_outlined),
                    title: Text(
                      "0".tr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      controllerlang.changelang("ar");
                    },
                  ),
                ),
                Container(
                  color: Colors.grey.shade100,
                  child: ListTile(
                    iconColor: Colors.green.shade700,
                    leading: Icon(Icons.abc_sharp),
                    title: Text(
                      "1".tr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      controllerlang.changelang("en");
                    },
                  ),
                )
              ]),
        ),
        bottomNavigationBar:
          Container(
            color: Color(0xFF388E3C),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child:
             
               GNav(
                backgroundColor: Color(0xFF388E3C),
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.green,
                gap: 8,
                onTabChange: (index) {
                  controll.selectedindex.value = index;
                },
                padding: EdgeInsets.all(16),
                tabs: [
                  GButton(
                    icon: Icons.local_mall,
                    text: '24'.tr,
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: '25'.tr,
                  ),
                  GButton(
                    icon: Icons.add_shopping_cart,
                    text: '26'.tr,
                  ),
                  GButton(
                    icon: Icons.shopping_bag,
                    text: '47'.tr,
                  ),
                ],
             ),
            ),
          ),
        
        body:
       Obx(() =>  
        widgetpages.elementAt(controll.selectedindex.value)));
        
  }
}

class PageOne extends StatelessWidget {

   controller_homepage controll = Get.find();
  // controller_homepage controll = Get.put(controller_homepage()) ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(255, 184, 230, 186),
            ),
            child: TextFormField(
              onTap: () {
                showSearch(context: context, delegate: DataSearch());
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "27".tr,
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("28".tr,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 86, 84, 84)))),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: 
            Obx(() {
             if (controll.category.isNotEmpty) {
                return 
                GridView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      mainAxisSpacing: 20,
                    ),
                    itemCount: controll.category.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.to(showproduect(category:controll.category[index] ,  
                            ));
                          },
                          child: Container(
                            width: 210,
                            height: 210,
                            child: Column(
                              children: [
                                Image.network(
                                  controll.category[index].photo.toString(),
                                  width: 150,
                                  height: 150,
                                ),
                                Text(
                                  controll.category[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ));
                        
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } 
           }
            ),
          ),
        ],
      ),
    );
  }
}
