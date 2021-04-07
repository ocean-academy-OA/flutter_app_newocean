import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/ClassRoom/classroom_menu/classroom_menu.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/log_in.dart';
import 'package:flutter_app_newocean/Menu/Menubar_drawer.dart';
import 'package:flutter_app_newocean/Menu/ResponsiveMenu.dart';
import 'package:flutter_app_newocean/Webinar/flash_notification.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'route/Provider/provider_routing.dart';
import 'route/navigation_locator.dart';
import 'route/navigation_service.dart';
import 'route/routeNames.dart';

class MainLayout extends StatefulWidget {
  bool notification = true;
  MainLayout({
    this.child,
  });
  Widget child;

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.ondemand_video_rounded,
            color: Colors.red,
          ),
          onPressed: () {
            locator<NavigationService>().navigateTo(UpcomingWebinarRoute);
          },
        ),
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? MenuBarDrawer()
            : null,
        body: Container(
          child: Column(
            children: [
              sizingInformation.deviceScreenType == DeviceScreenType.mobile
                  ? SizedBox()
                  : Visibility(
                      visible: widget.notification,
                      child: FlashNotification(
                        dismissNotification: () {
                          setState(() {
                            widget.notification = false;
                          });
                        },
                      ),
                    ),
              ResponsiveMenu(),
              Expanded(child: widget.child),
            ],
          ),
        ),
      );
    });
  }
}
