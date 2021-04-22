import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login/Login_View/Login_responsive.dart';
import 'package:flutter_app_newocean/Login/Login_View/otp.dart';

import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesktopThanksForPurchasing extends StatefulWidget {
  @override
  _DesktopThanksForPurchasingState createState() =>
      _DesktopThanksForPurchasingState();
}

class _DesktopThanksForPurchasingState
    extends State<DesktopThanksForPurchasing> {
  @override
  void initState() {
    // TODO: implement initState
    getSession();
    super.initState();
  }

  @override
  final valueController = Get.find<ValueListener>();
  getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginResponsive.registerNumber = (prefs.getString('user') ?? null);
    print("thanks for ${LoginResponsive.registerNumber}");
    print("thanks for ${OTP.userID}");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Thanks for purchasing!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 30),
            Container(
                height: 200,
                child: Icon(
                  Icons.check_circle,
                  size: 200,
                  color: Colors.green,
                )),
            SizedBox(height: 30),
            Text('Your payment has been made successfully',
                style: TextStyle(fontSize: 20, color: Color(0xff333333))),
            SizedBox(height: 40),
            Container(
              height: 70,
              width: 200,
              child: FlatButton(
                color: Color(0xff0091D2),
                onPressed: () {
                  locator<NavigationService>().navigateTo(
                      '/ClassRoom?userNumber=${LoginResponsive.registerNumber}&typeOfCourse=${valueController.courseType.value}');
                },
                child: Text("Go to Courses",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
