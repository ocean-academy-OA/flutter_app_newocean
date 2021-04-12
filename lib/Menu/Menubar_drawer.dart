import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/Menu/Menu_DeskTop.dart';

import 'package:flutter_app_newocean/ocean_icon/ocean_icons.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';

import '../route/routeNames.dart';

class MenuBarDrawer extends StatefulWidget {
  @override
  _MenuBarDrawerState createState() => _MenuBarDrawerState();
}

class _MenuBarDrawerState extends State<MenuBarDrawer>
    with SingleTickerProviderStateMixin {
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
              child: Column(
            children: [
              menuItem(
                  icon: Icons.home, text: 'Home', naviagationPath: HomeRoute),
              menuItem(
                  icon: Icons.info,
                  text: 'About Us',
                  naviagationPath: AboutRoute),
              menuItem(
                  icon: Icons.miscellaneous_services_rounded,
                  text: 'Services',
                  naviagationPath: ServiceRoute),
              menuItem(
                  icon: Icons.book_rounded,
                  text: 'Courses',
                  naviagationPath: CourseRoute),
              menuItem(
                  icon: Icons.contact_page_outlined,
                  text: 'Contact Us',
                  naviagationPath: ContactUsRoute),
              menuItem(
                  icon: Icons.bar_chart,
                  text: 'Career',
                  naviagationPath: CareerRoute),
            ],
          )),
          // Expanded(
          //     child: ListView.builder(
          //   itemCount: menuItemList.length,
          //   itemBuilder: (context, counter) {
          //     return MenuItemWidget(
          //         title: menuItemList[counter].title,
          //         iconData: menuItemList[counter].icon);
          //   },
          // )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              color: Colors.grey[700],
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ),

          // menuItem(text: "About Us"),
          // menuItem(text: "Service"),
          // menuItem(text: "Contact Us"),
        ],
      ),
    );
  }

  MouseRegion menuItem({IconData icon, text, widget, naviagationPath}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Icon(
                icon,
                color: menu[text] ? Colors.blue : Colors.grey[500],
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: menu[text] ? Colors.blue : Colors.grey[500],
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            menu.updateAll((key, value) => menu[key] = false);
            menu[text] = true;
          });
          locator<NavigationService>().navigateTo(naviagationPath);

          ///todo named parameter routing
          print(text);
          scaffoldKey.currentState.openEndDrawer();
        },
      ),
    );
  }

  // GestureDetector menuItem({text, Widget widget}) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         menu.updateAll((key, value) => menu[key] = false);
  //         menu[text] = true;
  //       });
  //     },
  //     child: Text(
  //       text,
  //       style: TextStyle(
  //         color: menu[text] == true ? Colors.blue : Color(0xFF155575),
  //         //color: Colors.red,
  //         fontSize: 15.0,
  //         fontWeight: FontWeight.bold,
  //         //fontFamily: kfontname
  //       ),
  //     ),
  //   );
  // }
}
