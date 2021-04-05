import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/AboutUs/ViewsAbout/destop_aboutus.dart';
import 'package:flutter_app_newocean/AboutUs/ViewsAbout/mobile_aboutus.dart';
import 'package:flutter_app_newocean/AboutUs/ViewsAbout/tablet_aboutus.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveAboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileAboutUs(),
      tablet: TabletAboutUs(),
      desktop: DesktopAboutUs(),
    );
  }
}
