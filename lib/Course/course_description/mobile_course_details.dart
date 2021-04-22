import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newocean/Course/Course_widget/course_details_widget.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final _firestore = FirebaseFirestore.instance;

// ignore: must_be_immutable
class MobileCourseDetails extends StatefulWidget {
  String course;
  String trainer;

  String discription;
  String batch;
  // String section;
  // String chapter;

  MobileCourseDetails({
    this.course,
    this.trainer,
    this.discription,
    this.batch,
  });

  @override
  _MobileCourseDetailsState createState() => _MobileCourseDetailsState();
}

class _MobileCourseDetailsState extends State<MobileCourseDetails> {
  String syllabusid;

  void studentId() async {
    await for (var snapshot in _firestore
        .collection('course')
        .doc(widget.batch)
        .snapshots(includeMetadataChanges: true)) {
      print(snapshot.data());
      widget.trainer = snapshot.data()['trainername'];
      widget.discription = snapshot.data()['coursedescription'];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.course);
    print(widget.trainer);
    print(widget.batch);
    print(widget.discription);
    // studentId();
  }

  // bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Color(0xff004B71),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.white,
                          onPressed: () {
                            Get.back();
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.course} Certificate Development Course',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Provider.of<Routing>(context, listen: false)
                      //     .updateRouting(widget: AboutUs());
                    },
                    child: Text(
                      '${widget.trainer}',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Online Course',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 20.0),
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.dashboard,
                      //         color: Colors.white,
                      //         size: 25.0,
                      //       ),
                      //       SizedBox(
                      //         width: 5.0,
                      //       ),
                      //       Text(
                      //         '${widget.time} Session',
                      //         style: TextStyle(
                      //             color: Colors.white, fontSize: 15.0),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.video,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'By Zoom',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 500.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 30.0,
                  ),
                ]),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('course').snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading...");
                    } else {
                      final messages = snapshot.data.docs;
                      List<CourseCard> courseImage = [];
                      //List<String> subjects = [];
                      for (var message in messages) {
                        if (message.data()['coursename'] == widget.course) {
                          final courseRate = message.data()['rate'];
                          final contentImage = message.data()['img'];
                          final messageCourse = message.data()['coursename'];
                          final courseBatchid = message.data()['batchid'];
                          // final time = message.data()['time'];
                          // final date = message.data()['date'];
                          Timestamp timeStamp = message.data()['date1'];

                          final dutation = message.data()['duration'];
                          String monthFormat;
                          String dayTime;
                          int dayFormat;
                          int hourFormat;
                          int minuteFormat;

                          var month = DateFormat('MMMM');
                          var day = DateFormat('d');
                          var hour = DateFormat('hh');
                          var minute = DateFormat('mm');
                          var daytime = DateFormat('a');

                          monthFormat = month.format(timeStamp.toDate());
                          dayFormat = int.parse(day.format(timeStamp.toDate()));
                          hourFormat =
                              int.parse(hour.format(timeStamp.toDate()));
                          minuteFormat =
                              int.parse(minute.format(timeStamp.toDate()));
                          dayTime = daytime.format(timeStamp.toDate());

                          final card = CourseCard(
                            image: contentImage,
                            batchTime: '$hourFormat:$minuteFormat $dayTime',
                            batchDate: '$monthFormat $dayFormat',
                            duration: dutation,
                            amount: courseRate,
                            courseName: messageCourse,
                            batchid: courseBatchid,
                          );

                          courseImage.add(card);
                        }
                      }

                      return Column(
                        children: courseImage,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            // padding: EdgeInsets.symmetric(
            //     horizontal: 100.0, vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CourseDetailsHeadingText(title: 'Course Details'),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "${widget.discription}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: (MediaQuery.of(context).size.width / 1.2) - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseDetailsHeadingText(
                  title: 'Table Of Contents',
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('course')
                      .doc(widget.batch)
                      .collection('syllabus')
                      .orderBy("id")
                      .snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading...");
                    } else {
                      final messages = snapshot.data.docs;
                      List<CourseDescription> courseDetails = [];
                      String messageContent;
                      //List<String> subjects = [];
                      for (var message in messages) {
                        List<Widget> chapterWidget = [];
                        final messageText = message.data()[widget.trainer];
                        final messageSender = message.data()[widget.course];
                        // final messageSession =
                        //     message.data()[widget.time];
                        final messageCoursedescription =
                            message.data()[widget.discription];
                        // final docid = message.id;
                        // for (var k = 0;
                        //     k < syllabus.length + 1;
                        //     k++) {
                        //   print("k.String ${k.toString()}");
                        //   if (k.toString() == docid) {
                        final messageTopic = message.data()['section'];
                        for (var i = 0;
                            i < message.data()["chapter"].length;
                            i++) {
                          if ((chapterWidget == null)) {
                            return Container(
                              height: 700,
                              width: 500,
                              color: Colors.pinkAccent,
                            );
                          } else {
                            messageContent = message.data()["chapter"][i];
                            chapterWidget.add(
                              Container(
                                color: Colors.grey[100],
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        messageContent,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        }

                        final messageDubble = CourseDescription(
                          trainername: messageText,
                          coursename: messageSender,
                          // session: messageSession,
                          coursedescription: messageCoursedescription,
                          topic: messageTopic,
                          chapterWidget: chapterWidget,
                        );
                        courseDetails.add(messageDubble);

                        //   }
                        // }
                      }
                      return Column(
                        children: courseDetails,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
