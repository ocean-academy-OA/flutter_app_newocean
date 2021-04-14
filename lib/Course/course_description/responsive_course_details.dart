import 'package:flutter/material.dart';

import 'package:flutter_app_newocean/Course/course_description/course_details.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveCourseDetails extends StatelessWidget {
  String courseName;
  String batchId;
  String trainerName;
  String description;
  ResponsiveCourseDetails({
    this.courseName,
    this.trainerName,
    this.description,
    this.batchId,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: CourseDetails(
        batch: batchId,
        course: courseName,
        discription: description,
        trainer: trainerName,
      ),
      mobile: CourseDetails(),
      tablet: CourseDetails(),
    );
  }
}
