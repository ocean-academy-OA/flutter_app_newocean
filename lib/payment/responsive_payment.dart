import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/payment/desktop_payment.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsivePayment extends StatelessWidget {
  String courseName;
  String amount;
  List course;
  String courseImage;
  String batchid;

  ResponsivePayment(
      {this.amount,
      this.course,
      this.courseName,
      this.courseImage,
      this.batchid});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RazorPayWeb(),
      desktop: RazorPayWeb(
        course: [courseName],
        amount: amount,
        batchid: [batchid],
        courseImage: courseImage,
        courseName: courseName,
      ),
      tablet: RazorPayWeb(),
    );
  }
}
