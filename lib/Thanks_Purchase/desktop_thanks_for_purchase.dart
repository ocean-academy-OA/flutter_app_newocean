import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';

class DesktopThanksForPurchasing extends StatefulWidget {
  @override
  _DesktopThanksForPurchasingState createState() =>
      _DesktopThanksForPurchasingState();
}

class _DesktopThanksForPurchasingState
    extends State<DesktopThanksForPurchasing> {
  @override
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
                      '"/ClassRoom?userNumber=+91%201234567890&typeOfCourse=My%20Course"');
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
