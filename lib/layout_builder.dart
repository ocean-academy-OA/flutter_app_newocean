import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/Menu/Menubar_drawer.dart';
import 'package:flutter_app_newocean/Menu/ResponsiveMenu.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainLayout extends StatelessWidget {
  MainLayout({this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        key: scaffoldKey,
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? MenuBarDrawer()
            : null,
        body: Container(
          child: Column(
            children: [
              ResponsiveMenu(),
              Expanded(child: child),
            ],
          ),
        ),
      );
    });
  }
}
