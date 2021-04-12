import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Footer/desktop_footer_md.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/how_it_works.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/placement_company.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/reviews.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/tab_widget/main_badget_widget.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/tab_widget/our_client.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/tab_widget/slider_widget.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/tab_widget/what_is_new.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/upcoming_course_widget.dart';
import 'package:flutter_app_newocean/alert/alert_msg.dart';
import 'package:flutter_app_newocean/alert/bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Footer/tablet_footer.dart';

class TabletHome extends StatefulWidget {
  @override
  _TabletHomeState createState() => _TabletHomeState();
}

class _TabletHomeState extends State<TabletHome> {
  final keyIsFirstLoaded = 'is_first_loaded';
  String fullNameAlert;
  String phoneNumberAlert;
  String emailAlert;
  bool flag = true;
  Timer _timer;

  void initState() {
    // TODO: implement initState
    super.initState();
    // Navbar.visiblity = true;
    Future.delayed(
        Duration(seconds: 3), () => showDialogIfFirstLoaded(context));
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderWidget(),
            MainBadgeWidget(),
            UpcomingCourse(),
            PlacementCompany(),
            ReviewsSection(),
            OurClient(),
            WhatIsNew(),
            HowItWorks(),
            TabletFooter()
          ],
        ),
      ),
    );
  }

  Future showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);

    //TODO make as isFirstLoaded == null
    if (isFirstLoaded == true) {
      showCupertinoModalPopup(
        barrierColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return MobileBottomSheet(
            keyIsFirstLoaded: keyIsFirstLoaded,
          );
        },
      );
    }
  }
}
