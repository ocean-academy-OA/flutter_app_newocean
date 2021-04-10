import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newocean/Extension/Hover_Extension.dart';
import 'package:flutter_app_newocean/Menu/Menu_Tablet.dart';

import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';

import '../ocean_icon/ocean_icons.dart';
import '../route/routeNames.dart';

class MenuBarDesktop extends StatefulWidget {
  MenuBarDesktop({this.child});
  Widget child;
  static bool visiblity = true;
  static bool isNotification = true;

  @override
  _MenuBarDesktopState createState() => _MenuBarDesktopState();
}

class _MenuBarDesktopState extends State<MenuBarDesktop> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //retriveTime();
    //session();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < 1240) {
        return MenuBarTablet();
      } else {
        return NavbarRouting();
      }
    });
  }
}

class NavbarRouting extends StatefulWidget {
  static Map menu = {
    'Home': true,
    'About Us': false,
    'Services': false,
    'Course': false,
    'Contact Us': false,
    'Career': false,
  };

  @override
  _NavbarRoutingState createState() => _NavbarRoutingState();
}

class _NavbarRoutingState extends State<NavbarRouting> {
  @override
  String valueChoose;
  List<String> courseList = [
    'Online',
    'Offline',
  ];
//overlay variable
//   GlobalKey dropdownKey;
//   bool isDropdown = false;
//   double height, width, xPosition, yPosition;
//   OverlayEntry floatingDropdown;
//
//   findDropdownData() {
//     RenderBox renderBox = dropdownKey.currentContext.findRenderObject();
//     height = renderBox.size.height;
//     width = renderBox.size.width;
//     Offset offset = renderBox.localToGlobal(Offset.zero);
//     xPosition = offset.dx;
//     yPosition = offset.dy;
//   }
//
//   OverlayEntry createFloatingDropdown() {
//     return OverlayEntry(builder: (context) {
//       return Positioned(
//           left: xPosition,
//           width: width,
//           top: height + xPosition + 5,
//           height: courseList.length * height,
//           child: Container(
//             height: 100,
//             width: 100,
//             color: Colors.red,
//           ));
//     });
//   }
//overlay variable
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dropdownKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFECF5FF),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Ocean.oa,
                    color: Color(0xFF0091D2),
                    size: 50,
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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: MediaQuery.of(context).size.width > 1170 ? 700 : 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      menuItem(text: 'Home', naviagationPath: HomeRoute),

                      menuItem(text: 'About Us', naviagationPath: AboutRoute),

                      menuItem(text: 'Services', naviagationPath: ServiceRoute),

                      ///todo dropdown button to remove the hide
                      // menuItem(text: 'Course', widget: Course()),

                      //===================
                      // MouseRegion(
                      //   cursor: SystemMouseCursors.click,
                      //   child: GestureDetector(
                      //     child: Text(
                      //       'Course',
                      //       style: TextStyle(
                      //           color: Color(0xFF155575),
                      //           fontSize: 20.0,
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: "Gilroy"),
                      //     ),
                      //     key: dropdownKey,
                      //     onTap: () {
                      //       isDropdown = !isDropdown;
                      //       if (isDropdown) {
                      //         findDropdownData();
                      //         floatingDropdown = createFloatingDropdown();
                      //         Overlay.of(context).insert(floatingDropdown);
                      //       } else {
                      //         floatingDropdown.remove();
                      //       }
                      //     },
                      //   ),
                      // ),
                      //=======================

                      // Column(
                      //   children: [
                      //     DropdownButton(
                      //       hint: Text(
                      //         "Courses",
                      //         style: TextStyle(
                      //             fontSize: 20.0,
                      //             fontWeight: FontWeight.bold,
                      //             fontFamily: "Gilroy"),
                      //       ),
                      //       onChanged: (newValue) {
                      //         valueChoose = newValue;
                      //         print(valueChoose);
                      //         // valueChoose == "Online"
                      //         // ? locator<NavigationService>()
                      //         //     .navigateTo(OnlineRoute)
                      //         // : locator<NavigationService>()
                      //         //     .navigateTo(OfflineRoute);
                      //       },
                      //       items: [
                      //         DropdownMenuItem(
                      //           child: Text("Online"),
                      //           value: "Online",
                      //         ),
                      //         DropdownMenuItem(
                      //           child: Text("Offline"),
                      //           value: "Offline",
                      //         )
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // DropdownButton(
                      //   value: 'test',
                      //   onChanged: (value) {},
                      //   items: [
                      //     DropdownMenuItem(
                      //       child: Text('test'),
                      //       value: 'test',
                      //     ),
                      //     DropdownMenuItem(
                      //       child: Text('test'),
                      //       value: 'tesgt',
                      //     ),
                      //   ],
                      // ),
                      menuItem(text: 'Course', naviagationPath: CourseRoute),
                      menuItem(
                          text: 'Contact Us', naviagationPath: ContactUsRoute),

                      menuItem(text: 'Career', naviagationPath: CareerRoute),
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
                    locator<NavigationService>().navigateTo(LoginRoute);

                    setState(() {
                      NavbarRouting.menu.updateAll(
                          (key, value) => NavbarRouting.menu[key] = false);
                    });

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
          ],
        ),
      ),
      //
    );
  }

  MouseRegion menuItem({text, widget, naviagationPath}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(
          text,
          style: TextStyle(
              color: NavbarRouting.menu[text] ? Colors.blue : Color(0xFF155575),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Gilroy"),
        ),
        onTap: () {
          setState(() {
            NavbarRouting.menu
                .updateAll((key, value) => NavbarRouting.menu[key] = false);
            NavbarRouting.menu[text] = true;
          });
          locator<NavigationService>().navigateTo(naviagationPath);

          ///todo named parameter routing
          print(text);
        },
      ),
    );
  }
}
