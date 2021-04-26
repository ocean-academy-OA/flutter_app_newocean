import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login_Menubar/loginEndDrawer.dart';
import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:get/get.dart';

class AllEndDrawer extends StatefulWidget {
  @override
  _AllEndDrawerState createState() => _AllEndDrawerState();
}

class _AllEndDrawerState extends State<AllEndDrawer> {
  final valueController = Get.find<ValueListener>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (valueController.navebars.value == 'Login') {
        return LoginEndDrawer();
      } else if (valueController.navebars.value == 'Webinar') {
        return LoginEndDrawer();
      } else {
        return LoginEndDrawer();
      }
    });
  }
}
