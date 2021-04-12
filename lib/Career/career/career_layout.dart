import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Career/career/Mobile_Career/mobile_career.dart';
import 'package:flutter_app_newocean/Career/career/Tab_Career/tab_career.dart';
import 'package:flutter_app_newocean/Career/career/career_lg.dart';
import 'package:flutter_app_newocean/Career/career/career_md.dart';
import 'package:flutter_app_newocean/Career/career/career_sm.dart';

class CareerLayout extends StatelessWidget {
  static final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1600) {
        return CareerLg();
      } else if (constraints.maxWidth > 1300 && constraints.maxWidth < 1601) {
        return CareerMd();
      } else if (constraints.maxWidth > 901 && constraints.maxWidth < 1301) {
        return CareerSm();
      } else if (constraints.maxWidth > 601 && constraints.maxWidth < 900) {
        return TabCareer();
      } else if (constraints.maxWidth > 300 && constraints.maxWidth < 600) {
        return MobileCareer();
      }
    });
  }
}
