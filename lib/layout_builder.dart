import 'package:flutter/material.dart';

import 'package:flutter_app_newocean/Landing/Home_view.dart';

import 'package:flutter_app_newocean/Menu/Menubar_drawer.dart';
import 'package:flutter_app_newocean/Menu/ResponsiveMenu.dart';
import 'package:flutter_app_newocean/Webinar/flash_notification.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'route/navigation_locator.dart';
import 'route/navigation_service.dart';
import 'route/routeNames.dart';

class MainLayout extends StatefulWidget {
  static bool sticNotification = true;
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        key: scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop
            ? null
            : FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.ondemand_video_rounded,
                  color: Colors.red,
                ),
                onPressed: () {
                  locator<NavigationService>().navigateTo(UpcomingWebinarRoute);
                },
              ),
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? MediaQuery.of(context).size.width < 1240
                ? MenuBarDrawer()
                : null
            : MenuBarDrawer(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              sizingInformation.deviceScreenType == DeviceScreenType.desktop
                  ? FlashNotification(
                      dismissNotification: () {
                        setState(() {
                          widget.notification = true;
                        });
                      },
                    )
                  : SizedBox(),
              ResponsiveMenu(),
              Expanded(child: widget.child),
            ],
          ),
        ),
      );
    });
  }
}
