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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Welcome Back',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Valid Mobile Number',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
