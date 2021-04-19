import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Buttons/switch_button.dart';

class NavigateTest extends StatefulWidget {
  @override
  _NavigateTestState createState() => _NavigateTestState();
}

class _NavigateTestState extends State<NavigateTest> {
  bool isCourseMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SwitchButton(onChanged: (value) {
            isCourseMode = value;
          }),
        ),
        isCourseMode ? Text("k.jaya") : Text("latha")
      ],
    );
  }
}
