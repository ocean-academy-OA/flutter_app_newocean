import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:get/get.dart';

class MobileWebinarMenubar extends StatefulWidget {
  @override
  _MobileWebinarMenubarState createState() => _MobileWebinarMenubarState();
}

class _MobileWebinarMenubarState extends State<MobileWebinarMenubar> {
  final valueController = Get.find<ValueListener>();

  @override
  Widget build(BuildContext context) {
    // valueController.navebars.value = 'Webinar';
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.menu_sharp),
              color: Colors.blue,
              onPressed: () {
                scaffoldKey.currentState.openDrawer();
              }),
          Image.asset(
            'images/OA.png',
            width: 300,
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.phone),
                  color: Colors.blue,
                  onPressed: () {
                    locator<NavigationService>().navigateTo(ContactUsRoute);
                  })
            ],
          )
        ],
      ),
    );
  }
}
