import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newocean/Extension/Hover_Extension.dart';
import 'package:flutter_app_newocean/Menu/Menu_Tablet.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';

class MenuBarDesktop extends StatefulWidget {
  MenuBarDesktop({this.child});
  Widget child;
  static bool visiblity = true;
  static bool isNotification = true;

  @override
  _MenuBarDesktopState createState() => _MenuBarDesktopState();
}

class _MenuBarDesktopState extends State<MenuBarDesktop> {
  // Timestamp timestamp;
  // void retriveTime() async {
  //   await for (var snapshot in _firestore
  //       .collection('webinar')
  //       .snapshots(includeMetadataChanges: true)) {
  //     for (var message in snapshot.docs) {
  //       timestamp = message.data()['timeStamp'];
  //     }
  //   }
  // }

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
        return Column(
          children: [
            // StreamBuilder<QuerySnapshot>(
            //     stream: _firestore.collection('Webinar').snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         if (snapshot.data.docs.isNotEmpty) {
            //           return Visibility(
            //             visible: Navbar.isNotification,
            //             child: FlashNotification(
            //               dismissNotification: () {
            //                 setState(() {
            //                   Navbar.isNotification = false;
            //                 });
            //               },
            //             ),
            //           );
            //         } else {
            //           return SizedBox();
            //         }
            //       } else {
            //         return SizedBox();
            //       }
            //     }),
            NavbarRouting(),
          ],
        );
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(" OA "),
                  SizedBox(
                    width: 10,
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
                      Column(
                        children: [
                          DropdownButton(
                            hint: Text(
                              "Courses",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Gilroy"),
                            ),
                            onChanged: (newValue) {
                              valueChoose = newValue;
                              print(valueChoose);
                              // valueChoose == "Online"
                              // ? locator<NavigationService>()
                              //     .navigateTo(OnlineRoute)
                              // : locator<NavigationService>()
                              //     .navigateTo(OfflineRoute);
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Online"),
                                value: "Online",
                              ),
                              DropdownMenuItem(
                                child: Text("Offline"),
                                value: "Offline",
                              )
                            ],
                          ),
                        ],
                      ),
                      menuItem(
                          text: 'Contact Us', naviagationPath: ContactUsRoute),

                      menuItem(
                        text: 'Career',
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
