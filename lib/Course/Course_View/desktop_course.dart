import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Buttons/switch_button.dart';
import 'package:flutter_app_newocean/Course/Course_widget/offline_course_card.dart';
import 'package:flutter_app_newocean/Course/Course_widget/online_course_card.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

final _firestore = FirebaseFirestore.instance;

class DesktopCourse extends StatefulWidget {
  @override
  _DesktopCourseState createState() => _DesktopCourseState();
}

class _DesktopCourseState extends State<DesktopCourse> {
  bool isOnline = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchButton(
                open: isOnline,
                onChanged: (value) {
                  setState(() {
                    isOnline = value;
                  });
                },
              ),
            ],
          ),
          !isOnline
              ? StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('course').snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading...");
                    } else {
                      final messages = snapshot.data.docs;

                      List<OnlineCourseCard> messageBubbles = [];
                      for (var message in messages) {
                        final messageText = message.data()['trainername'];
                        final messageSender = message.data()['coursename'];
                        final messageDuration = message.data()['duration'];
                        final messageTime = message.data()['time'];
                        final messageDate = message.data()['date'];
                        final messageImage = message.data()['img'];
                        final messageDescription =
                            message.data()['coursedescription'];
                        final messageBatchid = message.data()['batchid'];
                        final timeStamp = message.data()['date1'];

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
                        hourFormat = int.parse(hour.format(timeStamp.toDate()));
                        minuteFormat =
                            int.parse(minute.format(timeStamp.toDate()));
                        dayTime = daytime.format(timeStamp.toDate());

                        final messageBubble = OnlineCourseCard(
                          trainername: messageText,
                          coursename: messageSender,
                          duration: messageDuration,
                          time: '$hourFormat:$minuteFormat $dayTime',
                          date: '$dayFormat $monthFormat',
                          image: messageImage,
                          description: messageDescription,
                          batchid: messageBatchid,
                          onPressed: () {
                            print(messageSender);
                            locator<NavigationService>().navigateTo(
                                'CourseDetails?online=$messageSender');
                          },
                        );
                        // Text('$messageText from $messageSender');
                        messageBubbles.add(messageBubble);
                      }

                      return Wrap(
                        alignment: WrapAlignment.center,
                        children: messageBubbles,
                      );
                    }
                  },
                )
              : StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('offline_course').snapshots(),
// ignore: missing_return
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading...");
                    } else {
                      final messages = snapshot.data.docs;

                      List<OfflineCourseCard> offlineCourse = [];
                      for (var message in messages) {
                        final messageSender = message.data()['coursename'];
                        final messagePdflink = message.data()['pdflink'];
                        final messageImage = message.data()['img'];

                        final messageCourse = OfflineCourseCard(
                          coursename: messageSender,
                          pdfLink: messagePdflink,
                          image: messageImage,
                        );
// Text('$messageText from $messageSender');
                        offlineCourse.add(messageCourse);
                      }

                      return Wrap(
                        alignment: WrapAlignment.center,
                        children: offlineCourse,
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}
