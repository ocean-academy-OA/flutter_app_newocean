import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Alert/alert_msg.dart';
import 'package:flutter_app_newocean/Home/how_it_works.dart';
import 'package:flutter_app_newocean/Home/main_badget_widget.dart';
import 'package:flutter_app_newocean/Home/our_client.dart';
import 'package:flutter_app_newocean/Home/placement_company.dart';
import 'package:flutter_app_newocean/Home/reviews.dart';
import 'package:flutter_app_newocean/Home/slider_widget.dart';
import 'package:flutter_app_newocean/Home/upcoming_course_widget.dart';
import 'package:flutter_app_newocean/Home/what_is_new.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final keyIsFirstLoaded = 'is_first_loaded';
  String fullNameAlert;
  String phoneNumberAlert;
  String emailAlert;
  bool flag = true;
  Timer _timer;

  void initState() {
    // TODO: implement initState
    super.initState();
    //Navbar.visiblity = true;
    // Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    // _timer = Timer(Duration(seconds: 0), () {
    //   showDialogIfFirstLoaded(context);
    // });
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
            //Footer(),
          ],
        ),
      ),
    );
  }

// Future showDialogIfFirstLoaded(BuildContext context) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
//
//   //TODO make as isFirstLoaded == null
//   if (isFirstLoaded == true) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertEnquiry(
//           keyIsFirstLoaded: keyIsFirstLoaded,
//         );
//       },
//     );
//   }
// }
}
