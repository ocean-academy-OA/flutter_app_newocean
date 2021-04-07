import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/ClassRoom/classroom_menu/classroom_menu.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/log_in.dart';
import 'package:flutter_app_newocean/Menu/Menubar_drawer.dart';
import 'package:flutter_app_newocean/Menu/ResponsiveMenu.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'route/Provider/provider_routing.dart';

class MainLayout extends StatelessWidget {
  MainLayout({
    this.child,
  });
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
