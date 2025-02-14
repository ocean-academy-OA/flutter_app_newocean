import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_newocean/Webinar/WebinarCard_Desktop/join_successfully.dart';
import 'package:flutter_app_newocean/Webinar/WebinarCard_Desktop/webinar_const.dart';
import 'package:flutter_app_newocean/Webinar/WebinarCard_Desktop/webinar_footer.dart';
import 'package:flutter_app_newocean/Webinar/WebinarCard_Desktop/webinar_list.dart';
import 'package:flutter_app_newocean/Webinar/WebinarCard_Desktop/webinar_pament.dart';
import 'package:flutter_app_newocean/common/constants.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

// ignore: must_be_immutable
class SingleWebinarScreen extends StatefulWidget {
  //= (10, 2021 at 10:30:00 AM UTC+5:30);

  SingleWebinarScreen({this.topic});
  String topic;
  String payment;
  @override
  _SingleWebinarScreenState createState() => _SingleWebinarScreenState();
}

class _SingleWebinarScreenState extends State<SingleWebinarScreen> {
  bool timeUp;
  var sDate;
  bool isPlaying = false;
  int yearFormat;
  int monthFormat;
  int dayFormat;
  int hourFormat;
  int minuteFormat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Webinar').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return LinearProgressIndicator(
                        backgroundColor: Colors.blue);
                  } else {
                    List<Widget> currentWebinar = [];
                    List<Widget> wbinars = [];
                    final getFreeWebinar = snapshot.data;

                    for (var a in getFreeWebinar.docs) {
                      List<Widget> allTopics = [];
                      Timestamp timestamp = a.data()['timestamp'];

                      var year = DateFormat('y');
                      var month = DateFormat('MM');
                      var day = DateFormat('d');
                      var hour = DateFormat('hh');
                      var minute = DateFormat('mm');
                      yearFormat = int.parse(year.format(timestamp.toDate()));
                      monthFormat = int.parse(month.format(timestamp.toDate()));
                      dayFormat = int.parse(day.format(timestamp.toDate()));
                      hourFormat = int.parse(hour.format(timestamp.toDate()));
                      minuteFormat =
                          int.parse(minute.format(timestamp.toDate()));
                      var timeFormat =
                          DateFormat('a').format(timestamp.toDate());

                      sDate = DateTime(
                              yearFormat,
                              monthFormat,
                              dayFormat,
                              timeFormat == 'AM' ? hourFormat : hourFormat + 12,
                              minuteFormat)
                          .difference(DateTime.now())
                          .inSeconds;
                      final topicSubtitle = a.data()['topic subtitle'];
                      final topicTitle = a.data()['topic title'];
                      print(topicTitle.length);
                      for (var i = 0; i < topicTitle.length; i++) {
                        Column topics = Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: 1000,
                              child: Text(
                                topicTitle[i],
                                style: kContentTitle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.only(left: 18),
                              width: 1000,
                              child: Text(
                                topicSubtitle[i],
                                style: kContentSubtitle,
                              ),
                            )
                          ],
                        );
                        allTopics.add(topics);
                      }
                      final webinarVideo = a.data()['webinar video'];
                      final dBcourse = a.data()['course'];
                      final dBsuperTitle = a.data()['super title'];
                      final dBmainSubtitle = a.data()['main subtitle'];
                      final dBmainTitle = a.data()['main title'];
                      final dBtrainerImage = a.data()['trainer image'];
                      final dBtrainerName = a.data()['trainer name'];
                      final dBpayment = a.data()['payment'];
                      String dBstudentEnrolled = a.data()['student enrolled'];
                      final dBwebinarDuration = a.data()['webinar duration'];
                      final dBmentorImage = a.data()['mentor image'];
                      final dBaboutMentor = a.data()['about mentor'];

                      if (sDate > 0) {
                        int dBwebinarTime = sDate;
                        if (dBcourse == widget.topic) {
                          SingleWebinarDB singleWebinar = SingleWebinarDB(
                            superTitle: dBsuperTitle,
                            mainTitle: dBmainTitle,
                            mainSubtitle: dBmainSubtitle,
                            trainerImage: dBtrainerImage,
                            trainerName: dBtrainerName,
                            course: dBcourse,
                            payment: dBpayment,
                            studentEnrolled: int.parse(dBstudentEnrolled),
                            webinarDuration: dBwebinarDuration,
                            webinarTime: dBwebinarTime,
                            mentorImage: dBmentorImage,
                            aboutMentor: dBaboutMentor,
                            allTopics: allTopics,
                            webinarVideo: webinarVideo,
                          );
                          wbinars.add(singleWebinar);
                        }
                      } else {
                        int dbwebinarTime = sDate;
                        if (dBcourse == widget.topic) {
                          SingleWebinarDB singleWebinar = SingleWebinarDB(
                            superTitle: dBsuperTitle,
                            mainTitle: dBmainTitle,
                            mainSubtitle: dBmainSubtitle,
                            trainerImage: dBtrainerImage,
                            trainerName: dBtrainerName,
                            course: dBcourse,
                            payment: dBpayment,
                            studentEnrolled: int.parse(dBstudentEnrolled),
                            webinarDuration: dBwebinarDuration,
                            webinarTime: dbwebinarTime,
                            mentorImage: dBmentorImage,
                            aboutMentor: dBaboutMentor,
                            allTopics: allTopics,
                            webinarVideo: webinarVideo,
                          );
                          currentWebinar.add(singleWebinar);
                        }
                      }
                    }
                    return currentWebinar.isNotEmpty
                        ? Column(children: currentWebinar)
                        : Column(children: wbinars);
                  }
                },
              ),
              WebinarFooter()
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SingleWebinarDB extends StatefulWidget {
  SingleWebinarDB({
    this.name,
    this.payment,
    this.mentorImage,
    this.studentEnrolled,
    this.email,
    this.phoneNumber,
    this.aboutMentor,
    this.allTopics,
    this.course,
    this.webinarDuration,
    this.mainSubtitle,
    this.mainTitle,
    this.superTitle,
    this.trainerImage,
    this.trainerName,
    this.webinarTime,
    this.webinarVideo,
  });
  String name;
  String phoneNumber;
  String email;
  int studentEnrolled;
  String course;
  String webinarDuration;

  String payment;
  List<Widget> allTopics;
  String aboutMentor;
  String mentorImage;
  String superTitle;
  String mainTitle;
  String mainSubtitle;
  String trainerImage;
  String trainerName;
  String webinarVideo;
  var webinarTime;
  VideoPlayerController _videoController;

  Future<void> _initializeVideoPlayerFuture;

  @override
  _SingleWebinarDBState createState() => _SingleWebinarDBState();
}

class _SingleWebinarDBState extends State<SingleWebinarDB> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool isPlay = false;

  Widget _buildName() {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
        LengthLimitingTextInputFormatter(40),
      ],
      validator: (value) {
        if (value.isEmpty) {
          return 'name is required';
        } else if (value.length < 3) {
          return 'character should be morethan 2';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.drive_file_rename_outline),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
        border: OutlineInputBorder(),
        hintText: "enter your name",
        labelText: 'Name',
      ),
      controller: nameController,
      onChanged: (value) {
        widget.name = value;
      },
    );
  }

  Widget _buildphonenumber() {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp(r"^\d+\.?\d{0,2}"),
        ),
        LengthLimitingTextInputFormatter(10),
      ],
      validator: (value) {
        if (value.isEmpty) {
          return 'phone_number is required';
        } else if (value.length < 10) {
          return 'invalid phone_number';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_android_outlined),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
        border: OutlineInputBorder(),
        hintText: 'Enter Your Number',
        labelText: 'Phone Number',
      ),
      controller: phoneNumberController,
      onChanged: (value) {
        widget.phoneNumber = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
      validator: (value) =>
          EmailValidator.validate(value) ? null : "please enter a valid email",
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
        border: OutlineInputBorder(),
        hintText: 'Enter Your Email',
        labelText: 'Email',
      ),
      controller: emailController,
      onChanged: (value) {
        widget.email = value;
      },
    );
  }

  void getData() async {
    http.Response response = await http.get(
        'https://free-webinar-registration.herokuapp.com/?name=${nameController.text}&title=${widget.mainTitle}-%20${widget.payment == 'free' ? 'Free Webinar' : 'Webinar'}&date=$day${dayCalled(day)}%20$month%20$year&time=$hours:$minutes$dayFormat%20to%20$toHours:$toMinutes$toDayFormat%20IST&speaker=${widget.trainerName}(Ex%20-%20Ocean%20Academy)&email=${emailController.text}&type=freewebinar');

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  bool isMouse = false;
  onenter(PointerEvent details) {
    setState(() {
      isMouse = true;
      print(details);
    });
  }

  onout(PointerEvent details) {
    setState(() {
      isMouse = false;
      print(details);
    });
  }

  showJoinDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: WebinarRazorPayWeb(
              amount: int.parse(widget.payment),
              courseName: widget.course,
              userName: widget.name,
              mobileNumber: widget.phoneNumber,
              email: widget.email,
              mainTitle: widget.mainTitle,
              trainerName: widget.trainerName,
            ),
          );
        });
  }

  String dayCalled(int day) {
    if (day == 1 || day == 21 || day == 31) {
      return 'st';
    } else if (day == 2 || day == 22) {
      return 'nd';
    } else if (day == 3 || day == 23) {
      return 'rd';
    } else {
      return 'th';
    }
  }

  int year, day, hours, toHours, minutes, toMinutes;
  String month, dayFormat, toDayFormat;

  @override
  void initState() {
    print('${widget.webinarTime} jjjjjjjjjjjjjjjjjjj');
    year = WebinarCard.timing[widget.course]['Year'];
    day = WebinarCard.timing[widget.course]['Day'];
    hours = WebinarCard.timing[widget.course]['Hours'];
    toHours = WebinarCard.timing[widget.course]['To Hours'];
    minutes = WebinarCard.timing[widget.course]['Minutes'];
    toMinutes = WebinarCard.timing[widget.course]['To Minutes'];
    month = WebinarCard.timing[widget.course]['Month'];
    dayFormat = WebinarCard.timing[widget.course]['DayFormat'];
    toDayFormat = WebinarCard.timing[widget.course]['To DayFormat'];

    // TODO: implement initState
    super.initState();
    widget._videoController =
        VideoPlayerController.network(widget.webinarVideo);
    widget._initializeVideoPlayerFuture = widget._videoController.initialize();
    widget._videoController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1351) {
        return Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text(widget.superTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: 1000,
                  child: Text(
                    widget.mainTitle,
                    style: kHeaddingTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 1000,
                  child: Text(
                    widget.mainSubtitle,
                    style: TextStyle(
                        inherit: false,
                        fontSize: 20,
                        color: Color(0xffFF757575),
                        fontFamily: kfontname,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                //mentor image and name and login
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 3),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 550,
                                width: 800,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    widget.trainerImage,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 800,
                                height: 70,
                                color: Colors.grey[200],
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'With ${widget.trainerName}',
                                  style: TextStyle(
                                      inherit: false,
                                      fontSize: 30,
                                      color: Colors.grey[700],
                                      fontFamily: kfontname,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                      Spacer(),
                      // Join and timer
                      Container(
                        width: 450,
                        height: 630,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: kBlue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: Offset(0, 4))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///TODO TextField and timer join button
                            //timer
                            Column(
                              children: [
                                Container(
                                  width: 600,
                                  height: 100,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 110,
                                        decoration: BoxDecoration(

                                            // border: Border.all(
                                            //     color: kBlue, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 47,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Positioned(
                                                        bottom: 0,
                                                        child:
                                                            SlideCountdownClock(
                                                          duration: Duration(
                                                              seconds: widget
                                                                  .webinarTime),
                                                          separator: ' : ',
                                                          textStyle: TextStyle(
                                                              fontSize: 40,
                                                              fontFamily:
                                                                  kfontname,
                                                              color: kBlue),
                                                          separatorTextStyle:
                                                              TextStyle(
                                                                  fontSize: 35,
                                                                  color: kBlue),
                                                          shouldShowDays: true,
                                                          onDone: () {
                                                            setState(() {
                                                              print(DateTime
                                                                  .now());
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 290,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'DAYS',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                      SizedBox(width: 1),
                                                      Text(
                                                        'HRS',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                      SizedBox(width: 1),
                                                      Text(
                                                        'MIN',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                      SizedBox(width: 1),
                                                      Text(
                                                        'SEC',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: Text(
                                    'Webinar Start In...',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  color: Colors.blue,
                                  width: double.infinity,
                                ),
                              ],
                            ),

                            Form(
                              key: _formKey,
                              child: Container(
                                height: 240,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildName(),
                                    _buildphonenumber(),
                                    _buildEmail(),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: MaterialButton(
                                  child: Text(
                                    'Join',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: kBlue,
                                  minWidth: double.infinity,
                                  height: 60,
                                  elevation: 0,
                                  hoverElevation: 0,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      if (widget.name != null &&
                                          widget.email != null &&
                                          widget.phoneNumber != null) {
                                        if (widget.payment == 'free') {
                                          _firestore
                                              .collection('webinar Users')
                                              .doc('+91 ${widget.phoneNumber}')
                                              .set({
                                            'name': widget.name,
                                            'email': widget.email,
                                            'Phone_Number':
                                                '+91 ${widget.phoneNumber}',
                                            'payment': widget.payment == 'free'
                                                ? 'free'
                                                : widget.payment
                                          });
                                          _firestore
                                              .collection('Webinar')
                                              .doc(widget.course)
                                              .update({
                                            'student enrolled':
                                                '${widget.studentEnrolled + 1}'
                                          });
                                          getData();
                                          locator<NavigationService>().navigateTo(
                                              'JoinSuccessfully?id=${widget.name}');

                                          // Provider.of<MenuBar>(context,
                                          //         listen: false)
                                          //     .updateMenu(widget: SizedBox());
                                          // Provider.of<Routing>(context,
                                          //         listen: false)
                                          //     .updateRouting(
                                          //         widget: JoinSuccessfully(
                                          //             joinUserName:
                                          //                 widget.name));
                                        } else {
                                          ///TODO payment Function
                                          await showJoinDialog(context);

                                          print('pement function');
                                        }
                                      }

                                      nameController.clear();
                                      emailController.clear();
                                      phoneNumberController.clear();
                                    }
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey[500], fontSize: 16),
                                    text:
                                        'By clicking the button above, you are creating an account with Ocean Academy and agree to our ',
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Privacy Policy taped');
                                            },
                                          text: 'Privacy Policy',
                                          style: TextStyle(color: kBlue)),
                                      TextSpan(text: ' and '),
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Terms of Use taped');
                                            },
                                          text: 'Terms of Use',
                                          style: TextStyle(color: kBlue)),
                                      TextSpan(
                                          text:
                                              ', including receiving emails. '),
                                    ]),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Spacer(flex: 3)
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 1000,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.group,
                                      size: 40,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${widget.studentEnrolled}+',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          inherit: false,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                Text(
                                  'STUDENTS ENROLLED',
                                  style: kContentSubtitle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              child: Divider(
                                thickness: 60,
                                color: Colors.grey[500],
                              ),
                              width: 3,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 40,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${widget.webinarDuration} Minutes',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          inherit: false,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                Text(
                                  'MASTERCLASS',
                                  style: kContentSubtitle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              child: Divider(
                                thickness: 60,
                                color: Colors.grey[500],
                              ),
                              width: 3,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.award,
                                      size: 35,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1,000+',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          inherit: false,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                Text(
                                  'STORIES ON OCEAN ACADEMY',
                                  style: kContentSubtitle,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                //Watch The Preview For This Masterclass
                Text(
                  'Watch The Preview For This Webinar',
                  style: kTitle,
                ),
                SizedBox(height: 20),
                FutureBuilder(
                  future: widget._initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        height: 510,
                        width: 870,
                        child: MouseRegion(
                          onEnter: onenter,
                          onExit: onout,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: widget
                                        ._videoController.value.aspectRatio,
                                    child: VideoPlayer(widget._videoController),
                                  ),
                                  VideoProgressIndicator(
                                    widget._videoController,
                                    colors: VideoProgressColors(
                                        playedColor: Colors.blue,
                                        bufferedColor: Colors.lightBlue[100]),
                                    allowScrubbing: true,
                                  ),
                                ],
                              ),
                              AnimatedOpacity(
                                opacity: isMouse ? 1 : 0,
                                duration: Duration(seconds: 1),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      IconButton(
                                        iconSize: 100,
                                        highlightColor: Colors.red,
                                        color: Colors.white,
                                        icon: isPlay
                                            ? Icon(Icons.pause)
                                            : Icon(Icons.play_arrow),
                                        onPressed: () {
                                          if (widget._videoController.value
                                              .isPlaying) {
                                            setState(() {
                                              isPlay = false;
                                              widget._videoController.pause();
                                            });
                                          } else {
                                            setState(() {
                                              isPlay = true;
                                              widget._videoController.play();
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 40),
                Text(
                  'What You’ll Learn',
                  style: kTitle,
                ),
                SizedBox(height: 40),
                Column(children: widget.allTopics),

                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'About Mentor',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.grey[100],
                            height: 650,
                            width: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    widget.aboutMentor,
                                    style: kContentSubtitle,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 50),
                          Container(
                            height: 650,
                            width: 500,
                            child: Image(
                              image: NetworkImage(widget.mentorImage),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            )
          ],
        );
      } else {
        return Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text(widget.superTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: 1000,
                  child: Text(
                    widget.mainTitle,
                    style: kHeaddingTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 1000,
                  child: Text(
                    widget.mainSubtitle,
                    style: TextStyle(
                        inherit: false,
                        fontSize: 20,
                        color: Color(0xffFF757575),
                        fontFamily: kfontname,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                //mentor image and name and login
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 550,
                                width: 800,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    widget.trainerImage,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 800,
                                height: 70,
                                color: Colors.grey[200],
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'With ${widget.trainerName}',
                                  style: TextStyle(
                                      inherit: false,
                                      fontSize: 30,
                                      color: Colors.grey[700],
                                      fontFamily: kfontname,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      // Join and timer
                      Container(
                        width: 450,
                        height: 630,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: kBlue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: Offset(0, 4))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///TODO TextField and timer join button
                            //timer
                            Column(
                              children: [
                                Container(
                                  width: 600,
                                  height: 100,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 110,
                                        decoration: BoxDecoration(

                                            // border: Border.all(
                                            //     color: kBlue, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 47,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Positioned(
                                                        bottom: 0,
                                                        child:
                                                            SlideCountdownClock(
                                                          duration: Duration(
                                                              seconds: widget
                                                                  .webinarTime),
                                                          separator: ' : ',
                                                          textStyle: TextStyle(
                                                              fontSize: 40,
                                                              fontFamily:
                                                                  kfontname,
                                                              color: kBlue),
                                                          separatorTextStyle:
                                                              TextStyle(
                                                                  fontSize: 35,
                                                                  color: kBlue),
                                                          shouldShowDays: true,
                                                          onDone: () {
                                                            setState(() {
                                                              print(DateTime
                                                                  .now());
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 290,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'DAYS',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                      SizedBox(width: 1),
                                                      Text(
                                                        'HRS',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                      SizedBox(width: 1),
                                                      Text(
                                                        'MIN',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                      SizedBox(width: 1),
                                                      Text(
                                                        'SEC',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                kfontname,
                                                            color: kBlue),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: Text(
                                    'Webinar Start In...',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  color: Colors.blue,
                                  width: double.infinity,
                                ),
                              ],
                            ),

                            Form(
                              key: _formKey,
                              child: Container(
                                height: 240,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildName(),
                                    _buildphonenumber(),
                                    _buildEmail(),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: MaterialButton(
                                  child: Text(
                                    'Join',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: kBlue,
                                  minWidth: double.infinity,
                                  height: 60,
                                  elevation: 0,
                                  hoverElevation: 0,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      if (widget.name != null &&
                                          widget.email != null &&
                                          widget.phoneNumber != null) {
                                        if (widget.payment == 'free') {
                                          _firestore
                                              .collection('webinar Users')
                                              .doc('+91 ${widget.phoneNumber}')
                                              .set({
                                            'name': widget.name,
                                            'email': widget.email,
                                            'Phone_Number':
                                                '+91 ${widget.phoneNumber}',
                                            'payment': widget.payment == 'free'
                                                ? 'free'
                                                : widget.payment
                                          });
                                          _firestore
                                              .collection('Webinar')
                                              .doc(widget.course)
                                              .update({
                                            'student enrolled':
                                                '${widget.studentEnrolled + 1}'
                                          });
                                          locator<NavigationService>().navigateTo(
                                              '$JoinSuccessfully?=${widget.name}');
                                          // Provider.of<MenuBar>(context,
                                          //         listen: false)
                                          //     .updateMenu(widget: SizedBox());
                                          // Provider.of<Routing>(context,
                                          //         listen: false)
                                          //     .updateRouting(
                                          //         widget: JoinSuccessfully(
                                          //             joinUserName:
                                          //                 widget.name));
                                        } else {
                                          ///TODO payment Function
                                          await showJoinDialog(context);
                                        }
                                      }
                                      getData();
                                      nameController.clear();
                                      emailController.clear();
                                      phoneNumberController.clear();
                                    }
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey[500], fontSize: 16),
                                    text:
                                        'By clicking the button above, you are creating an account with Ocean Academy and agree to our ',
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Privacy Policy taped');
                                            },
                                          text: 'Privacy Policy',
                                          style: TextStyle(color: kBlue)),
                                      TextSpan(text: ' and '),
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Terms of Use taped');
                                            },
                                          text: 'Terms of Use',
                                          style: TextStyle(color: kBlue)),
                                      TextSpan(
                                          text:
                                              ', including receiving emails. '),
                                    ]),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 1000,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.group,
                                      size: 40,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${widget.studentEnrolled}+',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          inherit: false,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                Text(
                                  'STUDENTS ENROLLED',
                                  style: kContentSubtitle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              child: Divider(
                                thickness: 60,
                                color: Colors.grey[500],
                              ),
                              width: 3,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 40,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${widget.webinarDuration} Minutes',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          inherit: false,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                Text(
                                  'MASTERCLASS',
                                  style: kContentSubtitle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              child: Divider(
                                thickness: 60,
                                color: Colors.grey[500],
                              ),
                              width: 3,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.award,
                                      size: 35,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1,000+',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          inherit: false,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                Text(
                                  'STORIES ON OCEAN ACADEMY',
                                  style: kContentSubtitle,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                //Watch The Preview For This Masterclass
                Text(
                  'Watch The Preview For This Webinar',
                  style: kTitle,
                ),
                SizedBox(height: 20),
                FutureBuilder(
                  future: widget._initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        height: 510,
                        width: 870,
                        child: MouseRegion(
                          onEnter: onenter,
                          onExit: onout,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: widget
                                        ._videoController.value.aspectRatio,
                                    child: VideoPlayer(widget._videoController),
                                  ),
                                  VideoProgressIndicator(
                                    widget._videoController,
                                    colors: VideoProgressColors(
                                        playedColor: Colors.blue,
                                        bufferedColor: Colors.lightBlue[100]),
                                    allowScrubbing: true,
                                  ),
                                ],
                              ),
                              AnimatedOpacity(
                                opacity: isMouse ? 1 : 0,
                                duration: Duration(seconds: 1),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      IconButton(
                                        iconSize: 100,
                                        highlightColor: Colors.red,
                                        color: Colors.white,
                                        icon: isPlay
                                            ? Icon(Icons.pause)
                                            : Icon(Icons.play_arrow),
                                        onPressed: () {
                                          if (widget._videoController.value
                                              .isPlaying) {
                                            setState(() {
                                              isPlay = false;
                                              widget._videoController.pause();
                                            });
                                          } else {
                                            setState(() {
                                              isPlay = true;
                                              widget._videoController.play();
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 40),
                Text(
                  'What You’ll Learn',
                  style: kTitle,
                ),
                SizedBox(height: 40),
                Column(children: widget.allTopics),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'About Mentor',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 650,
                            width: 500,
                            child: Image(
                              image: NetworkImage(widget.mentorImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 50),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            color: Colors.grey[100],
                            width: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    widget.aboutMentor,
                                    style: kContentSubtitle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            )
          ],
        );
      }
    });
  }
}
