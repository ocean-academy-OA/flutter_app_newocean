import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newocean/layout_builder.dart';

class ClassRoomBottomNavigationBar extends StatelessWidget {
  ClassRoomBottomNavigationBar({
    this.iconName,
    this.icon,
    this.onTap,
    this.color,
  });
  IconData icon;
  String iconName;
  Function onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                Text(
                  iconName,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
