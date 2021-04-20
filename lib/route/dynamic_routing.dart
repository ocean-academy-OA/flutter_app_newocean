import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/AboutUs/ViewsAbout/Responsive_about.dart';
import 'package:flutter_app_newocean/Career/career/career_layout.dart';
import 'package:flutter_app_newocean/ClassRoom/CourseView/Responsive_classroom_content.dart';
import 'package:flutter_app_newocean/ClassRoom/CourseView/desktop_classroom/desktop_CourseView.dart';
import 'package:flutter_app_newocean/ClassRoom/CourseView/navigateTest.dart';
import 'package:flutter_app_newocean/ContactUs/ContactUsViews/responsive_contact_us.dart';
import 'package:flutter_app_newocean/Course/Course_View/responsive_course.dart';
import 'package:flutter_app_newocean/Course/course_description/responsive_course_details.dart';
import 'package:flutter_app_newocean/Home/Views/responsive_home.dart';
import 'package:flutter_app_newocean/Login/Login_View/Login_responsive.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/OTP/otp.dart';
import 'package:flutter_app_newocean/Login/login_widget/new_user_screen/Registration/registration.dart';

import 'package:flutter_app_newocean/Service/ServiceViews/ResponsiveService.dart';
import 'package:flutter_app_newocean/Webinar/webinar_view/join_successfully.dart';
import 'package:flutter_app_newocean/Webinar/webinar_view/responsive_webinar.dart';
import 'package:flutter_app_newocean/Webinar/webinar_view/responsive_webinar_card.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:flutter_app_newocean/404/error_page.dart';
import 'routeNames.dart';

FirebaseAuth auth = FirebaseAuth.instance;
// ConfirmationResult confirmationResult;

Route<dynamic> generateRoute(
  RouteSettings settings,
) {
  if (settings.name.contains("WebinarJoin")) {
    String courseName = Uri.parse(settings.name).queryParameters["id"];

    print("$courseName SingleWebinarScreen");
    return _getPageRoute(
        ResponsiveWebinar(
          topic: courseName,
        ),
        settings);
  }
  if (settings.name.contains("ClassRoom")) {
    String userNumber = Uri.parse(settings.name).queryParameters["userNumber"];

    print("$userNumber Login user");
    return _getPageRoute(
      ResponsiveClassRoomContent(),
      settings,
    );
  }

  if (settings.name.contains("JoinSuccessfully")) {
    String userName = Uri.parse(settings.name).queryParameters["id"];

    print("$userName JoinSuccessfully");
    return _getPageRoute(
        ResponsiveWebinarJoinSuccessfully(
          userName: userName,
        ),
        settings);
  }
  if (settings.name.contains("CourseDetails")) {
    String courseName = Uri.parse(settings.name).queryParameters["online"];
    String batchID = Uri.parse(settings.name).queryParameters["batchID"];
    String trainer = Uri.parse(settings.name).queryParameters["trainer"];
    String description =
        Uri.parse(settings.name).queryParameters["description"];

    print("$courseName CourseDetails");
    return _getPageRoute(
        ResponsiveCourseDetails(
          courseName: courseName,
          batchId: batchID,
          trainerName: trainer,
          description: description,
        ),
        settings);
  }

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
    case CourseRoute:
      return _getPageRoute(
        ResponsiveCourse(),
        settings,
      );
    case DetailsRoute:
      String trainer = Uri.parse(settings.name).queryParameters["trainer"];
      String description =
          Uri.parse(settings.name).queryParameters["description"];
      String courseName = Uri.parse(settings.name).queryParameters["online"];
      String batchID = Uri.parse(settings.name).queryParameters["batchID"];
      return _getPageRoute(
        ResponsiveCourseDetails(
          courseName: courseName,
          batchId: batchID,
          trainerName: trainer,
          description: description,
        ),
        settings,
      );

    //======course

    case CareerRoute:
      return _getPageRoute(
        CareerLayout(),
        settings,
      );

    // login
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
    case UpcomingWebinarRoute:
      return _getPageRoute(
        ResponsiveWebinarCard(),
        settings,
      );
    case WebinarJoinRoute:
      String courseName = Uri.parse(settings.name).queryParameters["id"];
      return _getPageRoute(
        ResponsiveWebinar(
          topic: courseName,
        ),
        settings,
      );

    case JoinSuccessfullyRoute:
      String userName = Uri.parse(settings.name).queryParameters["id"];
      return _getPageRoute(
        ResponsiveWebinarJoinSuccessfully(
          userName: userName,
        ),
        settings,
      );
    // case MobileJoinSuccessfullyRoute:

    // --------------------------
    case testRoute:
      return _getPageRoute(
        NavigateTest(),
        settings,
      );
    case classRoom:
      return _getPageRoute(
        CoursesView(),
        settings,
      );
    default:
      return _getPageRoute(
        ResponsiveHome(),
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
