import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Buttons/border_button.dart';
import 'package:flutter_app_newocean/Course/Course_widget/online_course_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CourseDescription extends StatelessWidget {
  String coursename;
  String trainername;
  // String session;
  String coursedescription;
  String topic;
  List<Widget> chapterWidget = [];

  CourseDescription({
    this.coursename,
    this.trainername,
    // this.session,
    this.coursedescription,
    this.topic,
    this.chapterWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black, width: 1.0)),
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Column(
            children: [
              ExpansionTile(
                title: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "$topic",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                children: chapterWidget,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class CourseDetailsHeadingText extends StatelessWidget {
  CourseDetailsHeadingText({this.title, this.color = Colors.blue});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600]),
      ),
    );
  }
}

// ignore: must_be_immutable
class CourseCard extends StatefulWidget {
  String courseName;
  String batchid;
  String image;
  String batchTime;
  String batchDate;
  String duration;
  String amount;

  CourseCard(
      {this.batchTime,
      this.image,
      this.batchDate,
      this.duration,
      this.amount,
      this.courseName,
      this.batchid});

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  num fullRate;
  bool isLogin = false;
  bool isCourse = true;
  double dis = 50;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    num orgionlaAmmount = int.parse(widget.amount);
    double disCalc = (100 - dis) / 100;
    orgionlaAmmount = orgionlaAmmount / disCalc;
    fullRate = orgionlaAmmount;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: OnlineCourseCard.visiblity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: MediaQuery.of(context).size.width < 450 ? 180 : 260,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage('${widget.image}'),
                      fit: BoxFit.cover,
                      // height: 100.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.blue,
                          size: 22.0,
                        ),
                        SizedBox(width: 5),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5.0),
                          child: Text(
                            '${widget.batchTime}',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Colors.blue,
                          size: 22.0,
                        ),
                        SizedBox(width: 5),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5.0),
                          child: Text(
                            '${widget.batchDate}',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.blue,
                          size: 22.0,
                        ),
                        SizedBox(width: 5),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5.0),
                          child: Text(
                            '${widget.duration} Hrs',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.rupeeSign),
                      Text(
                        '$fullRate',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  Text('$dis %'),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.rupeeSign),
                      Text(
                        '${widget.amount}',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 25,
              )
            ],
          ),
          BorderButton(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            buttonWidth: 480,
            buttonName: 'Enroll Now',
            textStyle: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
            borderColor: Colors.blue,
            borderWidth: 2,
            buttonHeight: 60,
            borderRadius: 6,
          )
        ],
      ),
    );
  }
}
