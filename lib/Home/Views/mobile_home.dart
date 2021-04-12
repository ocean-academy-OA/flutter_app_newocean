import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Footer/mobile_footer.dart';

import 'package:flutter_app_newocean/Home/MobileHome_subTopics/how_it_works.dart';
import 'package:flutter_app_newocean/Home/MobileHome_subTopics/main_badget_widget.dart';
import 'package:flutter_app_newocean/Home/MobileHome_subTopics/placement_company.dart';
import 'package:flutter_app_newocean/Home/MobileHome_subTopics/reviews.dart';
import 'package:flutter_app_newocean/Home/MobileHome_subTopics/slider_widget.dart';
import 'package:flutter_app_newocean/Home/MobileHome_subTopics/upcoming_course_widget.dart';
import 'package:flutter_app_newocean/alert/alert_msg.dart';
import 'package:flutter_app_newocean/alert/bottom_sheet.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class MobileHome extends StatefulWidget {
  MobileHome({this.appBar});
  final AppBar appBar;

  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  GlobalKey<FormState> formKeyAlert = GlobalKey<FormState>();

  final keyIsFirstLoaded = 'is_first_loaded';

  String fullNameAlert;

  String phoneNumberAlert;

  String emailAlert;

  bool flag = true;

  GlobalKey<ScaffoldState> homeScaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 3), () => showDialogIfFirstLoaded(context));
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
            HowItWorks(),
            Footer(),
          ],
        ),
      ),
    );
  }

  Future showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    // var alertStyle = AlertStyle(
    //     animationType: AnimationType.fromTop,
    //     isCloseButton: flag,
    //     isOverlayTapDismiss: true,
    //     descStyle: TextStyle(fontWeight: FontWeight.bold),
    //     animationDuration: Duration(milliseconds: 400),
    //     alertBorder: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       // side: BorderSide(color: Colors.red),
    //     ),
    //     titleStyle: TextStyle(
    //         color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 25),
    //     constraints: BoxConstraints.expand(width: 5000, height: 1000),
    //     //First to chars "55" represents transparency of color
    //     overlayColor: Color(0x55000000),
    //     alertElevation: 100,
    //     alertAlignment: Alignment.topCenter);

    /// TODO insted of true = null
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
