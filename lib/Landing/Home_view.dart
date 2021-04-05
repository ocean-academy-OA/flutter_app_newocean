import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Home/Views/Tablet_home.dart';
import 'package:flutter_app_newocean/Home/Views/desktop_home.dart';
import 'package:flutter_app_newocean/Home/Views/desktop_home.dart';
import 'package:flutter_app_newocean/Home/Views/desktop_home.dart';
import 'package:flutter_app_newocean/Home/Views/mobile_home.dart';
import 'package:flutter_app_newocean/Menu/Menu_DeskTop.dart';
import 'package:flutter_app_newocean/Menu/Menu_Mobile.dart';
import 'package:flutter_app_newocean/Menu/Menu_Tablet.dart';
import 'package:flutter_app_newocean/Menu/Menubar_drawer.dart';
import 'package:flutter_app_newocean/Menu/ResponsiveMenu.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileHome(),
      tablet: TabletHome(),
      desktop: DesktopHome(),
    );
  }
}
