import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/Login/log_in.dart';

import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginResponsive extends StatefulWidget {
  // static bool isLogin = false;

  @override
  _LoginResponsiveState createState() => _LoginResponsiveState();
}

class _LoginResponsiveState extends State<LoginResponsive> {
  final valueController = Get.find<ValueListener>();
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: LogIn(),
      tablet: LogIn(),
      mobile: Center(
        child: Container(
          color: Colors.yellow,
          child: TextButton(
            child: Text('Login Your PC'),
            onPressed: () {
              valueController.navebars.value = 'Login';
            },
          ),
        ),
      ),
    );
  }
}
