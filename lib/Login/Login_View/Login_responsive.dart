import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/log_in.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginResponsive extends StatefulWidget {
  @override
  _LoginResponsiveState createState() => _LoginResponsiveState();
}

class _LoginResponsiveState extends State<LoginResponsive> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: LogIn(),
      tablet: LogIn(),
      mobile: Center(
        child: Text('Login Your PC'),
      ),
    );
  }
}
