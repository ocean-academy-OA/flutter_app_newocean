import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/ContactUs/desktop_contactus.dart';
import 'package:flutter_app_newocean/ContactUs/mobile_contactus.dart';
import 'package:flutter_app_newocean/ContactUs/tablet_contactus.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContactUs(),
      desktop: DesktopContactUs(),
      tablet: TabletContactUs(),
    );
  }
}
