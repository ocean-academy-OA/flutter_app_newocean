import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';

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
          Text(
            "oa",
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
          icon: Icon(Icons.home, color: Colors.blue),
          onPressed: () {},
        ),
      ],
    );
  }
}
