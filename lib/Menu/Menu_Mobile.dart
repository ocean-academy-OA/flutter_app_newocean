import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';

import '../ocean_icon/ocean_icons.dart';
import '../route/navigation_locator.dart';
import '../route/navigation_service.dart';
import '../route/routeNames.dart';

class MenuBarMobile extends StatefulWidget {
  @override
  _MenuBarMobileState createState() => _MenuBarMobileState();
}

class _MenuBarMobileState extends State<MenuBarMobile> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFECF5FF),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        // key: widget.scaffoldKey,
        onPressed: () {
          scaffoldKey.currentState.openDrawer();
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Ocean.oa,
            color: Color(0xFF0091D2),
            size: 30,
          ),
          Text(
            "ocean academy",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF0091D2),
                fontSize: 20),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.ondemand_video_rounded, color: Colors.red),
          onPressed: () {
            locator<NavigationService>().navigateTo(UpcomingWebinarRoute);
          },
        ),
      ],
    );
  }
}
