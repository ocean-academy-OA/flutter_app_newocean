import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/AboutUs/ViewsAbout/Responsive_about.dart';
import 'package:flutter_app_newocean/ContactUs/ContactUsViews/responsive_contact_us.dart';
import 'package:flutter_app_newocean/Home/Views/responsive_home.dart';
import 'package:flutter_app_newocean/Service/ServiceViews/ResponsiveService.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:flutter_app_newocean/404/error_page.dart';

Route<dynamic> generateRoute(
  RouteSettings settings,
) {
  // if (settings.name.contains("AboutDetail")) {
  //   String id = Uri.parse(settings.name).queryParameters["id"];
  //   print("${id}11111111111111111111111");
  //   return _getPageRoute(
  //     DetailAbout(name: id),
  //     settings,
  //   );
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
