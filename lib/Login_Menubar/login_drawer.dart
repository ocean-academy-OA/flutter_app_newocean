import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/ocean_icon/ocean_icons.dart';

class LoginDrawer extends StatefulWidget {
  @override
  _LoginDrawerState createState() => _LoginDrawerState();
}

class _LoginDrawerState extends State<LoginDrawer> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 250,
    //   color: Colors.blue[800],
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       // Container(
    //       //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //       //   child: Image.asset('images/alert.png'),
    //       // ),
    //       Container(
    //         color: Colors.blue,
    //         child: Column(
    //           children: [
    //             Icon(
    //               Ocean.oa,
    //               color: Colors.white,
    //               size: 50,
    //             ),
    //             Text(
    //               "Ocean Academy",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontFamily: 'Ubuntu',
    //                   fontSize: 30,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(bottom: 15, top: 8),
    //               color: Colors.transparent,
    //               height: 1,
    //             )
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //           child: Column(
    //             children: [
    //               menuItem(
    //                   icon: Icons.home, text: 'Home', naviagationPath: HomeRoute),
    //               menuItem(
    //                   icon: Icons.info,
    //                   text: 'About Us',
    //                   naviagationPath: AboutRoute),
    //               menuItem(
    //                   icon: Icons.miscellaneous_services_rounded,
    //                   text: 'Services',
    //                   naviagationPath: ServiceRoute),
    //               menuItem(
    //                   icon: Icons.book_rounded,
    //                   text: 'Courses',
    //                   naviagationPath: CourseRoute),
    //               menuItem(
    //                   icon: Icons.contact_page_outlined,
    //                   text: 'Contact Us',
    //                   naviagationPath: ContactUsRoute),
    //               menuItem(
    //                   icon: Icons.bar_chart,
    //                   text: 'Career',
    //                   naviagationPath: CareerRoute),
    //             ],
    //           )),
    //       // Expanded(
    //       //     child: ListView.builder(
    //       //   itemCount: menuItemList.length,
    //       //   itemBuilder: (context, counter) {
    //       //     return MenuItemWidget(
    //       //         title: menuItemList[counter].title,
    //       //         iconData: menuItemList[counter].icon);
    //       //   },
    //       // )),
    //       Container(
    //         margin: EdgeInsets.symmetric(vertical: 50),
    //         child: IconButton(
    //           icon: Icon(Icons.arrow_back_ios_outlined),
    //           color: Colors.grey[700],
    //           onPressed: () {
    //             scaffoldKey.currentState.openEndDrawer();
    //           },
    //         ),
    //       ),
    //
    //       // menuItem(text: "About Us"),
    //       // menuItem(text: "Service"),
    //       // menuItem(text: "Contact Us"),
    //     ],
    //   ),
    // );
  }
}
