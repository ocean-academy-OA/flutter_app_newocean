import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Course/Course_View/desktop_course.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: DesktopCourse(),
      mobile: DesktopCourse(),
      tablet: DesktopCourse(),
    );
  }
}
