import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/ClassRoom/CourseView/desktop_classroom/desktop_CourseView.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveClassRoomContent extends StatefulWidget {
  @override
  _ResponsiveClassRoomContentState createState() =>
      _ResponsiveClassRoomContentState();
}

class _ResponsiveClassRoomContentState
    extends State<ResponsiveClassRoomContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CoursesView(),
      tablet: CoursesView(),
      desktop: CoursesView(),
    );
  }
}
