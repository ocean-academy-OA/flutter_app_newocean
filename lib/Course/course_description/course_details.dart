import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({this.courseName});
  String courseName;

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${widget.courseName}'),
    );
  }
}
