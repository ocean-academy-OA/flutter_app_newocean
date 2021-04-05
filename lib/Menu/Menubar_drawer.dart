import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/Menu/menu_item.dart';
import 'package:flutter_app_newocean/Menu/menu_item_widget.dart';
import 'package:flutter_app_newocean/ocean_icon/ocean_icons.dart';

class MenuBarDrawer extends StatefulWidget {
  @override
  _MenuBarDrawerState createState() => _MenuBarDrawerState();
}

class _MenuBarDrawerState extends State<MenuBarDrawer>
    with SingleTickerProviderStateMixin {
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
      width: 250,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   child: Image.asset('images/alert.png'),
          // ),
          Container(
            color: Colors.blue,
            child: Column(
              children: [
                Icon(
                  Ocean.oa,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  "Ocean Academy",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, top: 8),
                  color: Colors.transparent,
                  height: 1,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: menuItemList.length,
            itemBuilder: (context, counter) {
              return MenuItemWidget(
                  title: menuItemList[counter].title,
                  iconData: menuItemList[counter].icon);
            },
          )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              color: Colors.grey[700],
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            ),
          )
          // menuItem(text: "Home"),
          // menuItem(text: "About Us"),
          // menuItem(text: "Service"),
          // menuItem(text: "Contact Us"),
        ],
      ),
    );
  }

  GestureDetector menuItem({text, Widget widget}) {
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

class context {}
