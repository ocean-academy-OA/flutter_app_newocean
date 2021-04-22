import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Buttons/pop_up_menu_botton_custamize.dart';
import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:get/get.dart';

class DesktopEndDrawer extends StatelessWidget {
  final valueController = Get.find<ValueListener>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: valueController.isFlashNotification.value ? 150 : 100),
      width: 300,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            // height: 300,
            width: 200,
            child: Column(
              children: [
                ProfileItems(
                  topRadius: 10,
                  icon: Icons.palette,
                  label: 'Edit Profile',
                ),
                ProfileItems(
                  icon: Icons.palette,
                  label: 'Edit Profile',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItems extends StatelessWidget {
  double bottonRadius;
  double topRadius;
  Function onPressed;
  IconData icon;
  String label;
  ProfileItems(
      {this.topRadius = 0,
      this.bottonRadius = 0,
      this.onPressed,
      this.icon,
      this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(topRadius),
            bottom: Radius.circular(bottonRadius)),
        color: Colors.white,
      ),
      // width: 50,
      // height: 50,
      child: FlatButton(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text('$label'),
            ],
          ),
          onPressed: onPressed),
    );
  }
}
