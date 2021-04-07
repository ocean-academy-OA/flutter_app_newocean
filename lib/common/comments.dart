import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/common/constants.dart';

class TextWidget extends StatelessWidget {
  final String title;
  TextWidget({this.title});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width -
            MediaQuery.of(context).size.width / 10,
        child: Text(
          title,
          style: otherSmallContentTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
