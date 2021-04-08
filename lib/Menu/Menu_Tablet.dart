import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newocean/Extension/Hover_Extension.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';

import '../ocean_icon/ocean_icons.dart';

class MenuBarTablet extends StatefulWidget {
  @override
  _MenuBarTabletState createState() => _MenuBarTabletState();
}

class _MenuBarTabletState extends State<MenuBarTablet> {
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
      centerTitle: true,
      title: Image.asset(
        'images/OA.png',
        width: 250,
      ),
      actions: [
        FlatButton(
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          color: Colors.blue,
          minWidth: 100,
          hoverColor: Colors.blue[700],
          onPressed: () {
            locator<NavigationService>().navigateTo(LoginRoute);
          },
        ),
        // MaterialButton(
        //   child: Text(
        //     "Log in",
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 20.0,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: "Gilroy"),
        //   ),
        //   minWidth: 150.0,
        //   height: 50,
        //   color: Color(0xFF0091D2),
        //   onPressed: () {
        //     locator<NavigationService>().navigateTo(LoginRoute);
        //
        //     ///todo:instead of resiter login will come
        //     ///
        //     // Provider.of<Routing>(context, listen: false).updateRouting(
        //     //     widget:
        //     //     MenuBar.stayUser == null ? LogIn() : CoursesView());
        //     // Provider.of<MenuBar>(context, listen: false).updateMenu(
        //     //     widget: MenuBar.stayUser == null
        //     //         ? NavbarRouting()
        //     //         : AppBarWidget());
        //   },
        // ).moveUpOnHover,
        // IconButton(
        //   icon: Icon(Icons.ondemand_video_rounded, color: Colors.red),
        //   onPressed: () {
        //     locator<NavigationService>().navigateTo(UpcomingWebinarRoute);
        //   },
        // ),
      ],
    );
  }
}
