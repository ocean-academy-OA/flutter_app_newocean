import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Buttons/pop_up_menu_botton_custamize.dart';
import 'package:flutter_app_newocean/Login/Login_View/Login_responsive.dart';
import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesktopEndDrawer extends StatefulWidget {
  @override
  _DesktopEndDrawerState createState() => _DesktopEndDrawerState();
}

class _DesktopEndDrawerState extends State<DesktopEndDrawer> {
  final valueController = Get.find<ValueListener>();

  getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginResponsive.registerNumber = (prefs.getString('user') ?? null);
    print("End_drayer session ${LoginResponsive.registerNumber}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: valueController.isFlashNotification.value ? 165 : 100),
      width: 300,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            //height: 300,
            width: 200,
            child: Column(
              children: [
                ProfileItems(
                  topRadius: 10,
                  icon: Icons.palette,
                  label: 'Edit Profile',
                  onPressed: () {
                    locator<NavigationService>().navigateTo(
                        "/Profile?id=${LoginResponsive.registerNumber}");
                  },
                ),
                ProfileItems(
                  icon: Icons.palette,
                  label: 'Certificate',
                  onPressed: () {
                    locator<NavigationService>().navigateTo(
                        "/Certificate?id=${LoginResponsive.registerNumber}");
                  },
                ),
                ProfileItems(
                  icon: Icons.palette,
                  label: 'Purchase',
                  onPressed: () {
                    locator<NavigationService>().navigateTo(
                        "/Purchase?id=${LoginResponsive.registerNumber}");
                  },
                ),
                ProfileItems(
                  icon: Icons.palette,
                  label: 'LogOut',
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setString('user', null);
                    LoginResponsive.registerNumber = null;
                    locator<NavigationService>().navigateTo(HomeRoute);
                    valueController.navebars.value = 'Home';
                  },
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
