import 'package:flutter/material.dart';

class MenuBarDrawer extends StatefulWidget {
  @override
  _MenuBarDrawerState createState() => _MenuBarDrawerState();
}

class _MenuBarDrawerState extends State<MenuBarDrawer> {
  Map menu = {
    'Home': true,
    'About Us': false,
    'Service': false,
    'Course': false,
    'Contact Us': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          menuItem(text: "Home"),
          menuItem(text: "Home"),
          menuItem(text: "Home"),
          menuItem(text: "Home"),
        ],
      ),
    );
  }

  GestureDetector menuItem({text, widget}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          menu.updateAll((key, value) => menu[key] = false);
          menu[text] = true;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: menu[text] == true ? Colors.blue : Color(0xFF155575),
          //color: Colors.red,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          //fontFamily: kfontname
        ),
      ),
    );
  }
}
