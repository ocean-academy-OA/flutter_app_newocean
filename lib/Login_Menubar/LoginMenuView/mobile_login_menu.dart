import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Landing/Home_view.dart';

class MobileLoginMenu extends StatefulWidget {
  @override
  _MobileLoginMenuState createState() => _MobileLoginMenuState();
}

class _MobileLoginMenuState extends State<MobileLoginMenu> {
  GlobalKey<ScaffoldState> classRoomKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                }),
            // Container(
            //   width: 40,
            //   height: 40,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.pink,
            //     image:
            //         DecorationImage(image: AssetImage('images/exProfile.png')),
            //   ),
            // ),
            //  PopupMenuButton(itemBuilder: ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                    fit: BoxFit.cover),
              ),
            )
          ],
        ));
  }
}
