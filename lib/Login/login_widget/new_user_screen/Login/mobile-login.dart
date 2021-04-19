import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_widget/input_text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class MobileLogin extends StatefulWidget {
  @override
  _MobileLoginState createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff006793),
      child: Column(
        children: [
          Text('Welcome Back'),
          Container(
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(50)),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Valid Mobile Number',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
