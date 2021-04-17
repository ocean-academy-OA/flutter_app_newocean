import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';
import 'package:flutter_app_newocean/Webinar/flash_notification.dart';
import 'package:flutter_app_newocean/all_menubar.dart';
import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'route/navigation_locator.dart';
import 'route/navigation_service.dart';
import 'route/routeNames.dart';

// ignore: must_be_immutable
class MainLayout extends StatefulWidget {
  // static bool sticNotification = true;
  bool notification = true;
  MainLayout({this.child, this.menubar});
  Widget child;
  Widget menubar;

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool isWebinar = true;
  final valueController = Get.find<ValueListener>();
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
                ? AllDrawer()
                : null
            : AllDrawer(),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                sizingInformation.deviceScreenType == DeviceScreenType.desktop
                    ? Obx(() {
                        return Visibility(
                          visible: valueController.isFlashNotification.value,
                          child: FlashNotification(
                            dismissNotification: () {
                              valueController.isFlashNotification.value = false;
                            },
                          ),
                        );
                      })
                    : SizedBox(),
                widget.menubar,
                sizingInformation.deviceScreenType == DeviceScreenType.desktop
                    ? SizedBox()
                    : valueController.isFlashNotification.value
                        ? Dismissible(
                            key: Key('webinar'),
                            background: Container(
                              color: Colors.blue,
                              height: 10,
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Free Webinar',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.red),
                                  ),
                                ],
                              ),
                              leading: IconButton(
                                icon: Icon(Icons.video_collection_outlined),
                                color: Colors.red,
                                onPressed: () {
                                  locator<NavigationService>()
                                      .navigateTo(UpcomingWebinarRoute);
                                },
                              ),
                              trailing: Icon(
                                Icons.swipe,
                                color: Colors.blue,
                              ),
                            ),
                            onDismissed: (deirection) {
                              // setState(() {
                              //   isWebinar = false;
                              // });
                              valueController.isFlashNotification.value = false;
                            },
                          )
                        : SizedBox(),
                Expanded(child: widget.child),
              ],
            ),
          ),
        ),
      );
    });
  }
}
