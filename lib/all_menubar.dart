import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login_Menubar/login_drawer.dart';
import 'package:flutter_app_newocean/Menu/Menubar_drawer.dart';
import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:get/get.dart';

class AllDrawer extends StatefulWidget {
  @override
  _AllDrawerState createState() => _AllDrawerState();
}

class _AllDrawerState extends State<AllDrawer> {
  final valueController = Get.find<ValueListener>();
  @override
  Widget build(BuildContext context) {
    return valueController.navebars.value == 'Login'
        ? LoginDrawer()
        : MenuBarDrawer();
  }
}
