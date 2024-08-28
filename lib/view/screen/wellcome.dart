

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_mvc/view/screen/login.dart';
import 'package:pharma_mvc/view/screen/registar.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Welcome to pharmacy",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Find your medicine easily",
            style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset("lib/images/logo1.jpg",
              width: 300, height: 300, fit: BoxFit.fill),
          SizedBox(
            height: 70,
          ),
          GestureDetector(
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: Text(
                "REGISTER",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
            onTap: () {
              Get.to(registar());
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
            onTap: () {
              Get.to(login());
            },
          )
        ]),
      )),
    );
  }
}
