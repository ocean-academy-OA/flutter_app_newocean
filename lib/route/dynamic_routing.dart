import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/AboutUs/ViewsAbout/Responsive_about.dart';
import 'package:flutter_app_newocean/Career/career_views/career_responsive.dart';
import 'package:flutter_app_newocean/ClassRoom/CourseView/navigateTest.dart';
import 'package:flutter_app_newocean/ClassRoom/classroom_menu/classroom_menu.dart';
import 'package:flutter_app_newocean/ContactUs/ContactUsViews/responsive_contact_us.dart';
import 'package:flutter_app_newocean/Home/Views/responsive_home.dart';
import 'package:flutter_app_newocean/Login/Login_View/Login_responsive.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/otp.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/registration.dart';
import 'package:flutter_app_newocean/Service/ServiceViews/ResponsiveService.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:flutter_app_newocean/404/error_page.dart';

import '../layout_builder.dart';
import 'routeNames.dart';

FirebaseAuth auth = FirebaseAuth.instance;
// ConfirmationResult confirmationResult;

Route<dynamic> generateRoute(
  RouteSettings settings,
) {
  // if (settings.name.contains("OTP")) {
  //   String mobileNumber =
  //       Uri.parse(settings.name).queryParameters["mobileNumber"];
  //
  //   print("${mobileNumber}11111111111111111111111");
  //   return _getPageRoute(
  //       OTP(
  //         number: mobileNumber,
  //       ),
  //       settings);
  // }
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(
        ResponsiveHome(),
        settings,
      );
    case AboutRoute:
      return _getPageRoute(
        ResponsiveAboutUs(),
        settings,
      );
    case ServiceRoute:
      return _getPageRoute(
        ResponsiveService(),
        settings,
      );
    case ContactUsRoute:
      return _getPageRoute(
        ResponsiveContactUs(),
        settings,
      );
    case CareerRoute:
      return _getPageRoute(
        ResponsiveCareer(),
        settings,
      );
    case LoginRoute:
      return _getPageRoute(
        LoginResponsive(),
        settings,
      );
    case OTPRoute:
      return _getPageRoute(
        OTP(),
        settings,
      );
    case RegistrationRoute:
      return _getPageRoute(
        Registration(),
        settings,
      );

    // --------------------------
    case testRoute:
      return _getPageRoute(
        NavigateTest(),
        settings,
      );
    default:
      return _getPageRoute(
        ErrorPage(),
        settings,
      );
  }
}

PageRoute _getPageRoute(
  Widget child,
  RouteSettings settings,
) {
  return _FadeRoute(
    child: child,
    routeName: settings.name,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({
    this.child,
    this.routeName,
  }) : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
