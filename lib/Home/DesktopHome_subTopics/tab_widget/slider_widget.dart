import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/common/constants.dart';
import 'package:flutter_app_newocean/route/Provider/provider_routing.dart';
import 'package:flutter_app_newocean/vedio_player/vedio_player.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_newocean/Extension/Hover_Extension.dart';

final _firestore = FirebaseFirestore.instance;
String hometitle;
String homecontent;

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  void getData() async {
    final message =
        await _firestore.collection('home').doc("lkAl4KhYwAkOjUpjo3SF").get();

    //print(courses.data()['img']);
    hometitle = message.data()['homeheading'];
    homecontent = message.data()['homepagecontent'];
    Provider.of<SliderContent>(context, listen: false)
        .updateValue(hometitle, homecontent);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        // image: DecorationImage(
        //   image: AssetImage("images/Slide.jpg"),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Consumer<SliderContent>(builder: (context1, cart, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${Provider.of<SliderContent>(context, listen: false).title}',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: kfontname,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: VideoPlayerScreen(),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "${Provider.of<SliderContent>(context, listen: false).description}",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: kfontname,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                  color: Colors.white,
                  textColor: textColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Enroll now ",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: kfontname,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ).moveUpOnHover,
              ],
            );
          })),
        ],
      ),
    );
  }
}
