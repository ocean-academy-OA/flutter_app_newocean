import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({this.courseName, this.batchId});
  String courseName;
  String batchId;

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${widget.courseName} ${widget.batchId}'),
    );
  }
}
