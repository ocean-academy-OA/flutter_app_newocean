import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newocean/Extension/Hover_Extension.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';

import '../ocean_icon/ocean_icons.dart';

class MenuBarTablet extends StatefulWidget {
  static Map menu = {
    'Home': true,
    'About Us': false,
    'Services': false,
    'Course': false,
    'Contact Us': false,
    'Career': false,
  };

  @override
  _MenuBarTabletState createState() => _MenuBarTabletState();
}

class _MenuBarTabletState extends State<MenuBarTablet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Ocean.oa,
                        color: Color(0xFF0091D2),
                        size: 45,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "ocean academy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0091D2),
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Gilroy"),
                  ),
                  padding: EdgeInsets.all(20.0),
                  minWidth: 150.0,
                  color: Color(0xFF0091D2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  onPressed: () {
                    // print('${MenuBar.stayUser}MenuBar.stayUser');
                    // print("${LogIn.registerNumber}LogIn.registerNumber");

                    // setState(() {
                    //   NavbarRouting.menu.updateAll(
                    //       (key, value) => NavbarRouting.menu[key] = false);
                    // });

                    ///todo:instead of resiter login will come
                    ///
                    // Provider.of<Routing>(context, listen: false).updateRouting(
                    //     widget:
                    //     MenuBar.stayUser == null ? LogIn() : CoursesView());
                    // Provider.of<MenuBar>(context, listen: false).updateMenu(
                    //     widget: MenuBar.stayUser == null
                    //         ? NavbarRouting()
                    //         : AppBarWidget());
                  },
                ).moveUpOnHover,
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildMouseRegion(text: "Home", naviagationPath: HomeRoute),
                buildMouseRegion(text: "About Us", naviagationPath: AboutRoute),
                buildMouseRegion(text: "Course"),
                buildMouseRegion(
                    text: "Services", naviagationPath: ServiceRoute),
                buildMouseRegion(
                    text: 'Contact Us', naviagationPath: ContactUsRoute),
                buildMouseRegion(text: "Career", naviagationPath: CareerRoute),
              ],
            ),
          ),
        ),
      ],
    );
  }

  MouseRegion buildMouseRegion({text, naviagationPath}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(
          text,
          style: TextStyle(
              color: MenuBarTablet.menu[text] ? Colors.blue : Color(0xFF155575),
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Gilroy"),
        ),
        onTap: () {
          setState(() {
            MenuBarTablet.menu
                .updateAll((key, value) => MenuBarTablet.menu[key] = false);
            MenuBarTablet.menu[text] = true;
          });
          locator<NavigationService>().navigateTo(naviagationPath);

          ///todo named parameter routing
          print(text);
        },
      ),
    );
  }
}
