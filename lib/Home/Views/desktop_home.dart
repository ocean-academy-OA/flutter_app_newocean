import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/how_it_works.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/main_badget_widget.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/our_client.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/placement_company.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/reviews.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/slider_widget.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/upcoming_course_widget.dart';
import 'package:flutter_app_newocean/Home/DesktopHome_subTopics/what_is_new.dart';

class DesktopHome extends StatefulWidget {
  @override
  _DesktopHomeState createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
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
