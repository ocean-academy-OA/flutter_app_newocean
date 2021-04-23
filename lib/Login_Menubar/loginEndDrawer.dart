import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login_Menubar/Login_Endrawer/desktop_end_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginEndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DesktopEndDrawer(),
      desktop: DesktopEndDrawer(),
      tablet: DesktopEndDrawer(),
    );
  }
}
