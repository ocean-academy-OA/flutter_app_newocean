import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login/Login_View/Login_responsive.dart';
import 'package:flutter_app_newocean/Menu/ResponsiveMenu.dart';
import 'package:flutter_app_newocean/layout_builder.dart';
import 'package:flutter_app_newocean/route/Provider/provider_routing.dart';
import 'package:flutter_app_newocean/route/dynamic_routing.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setupLocator();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SliderContent()),
          ChangeNotifierProvider(create: (context) => UpcomingModel()),
        ],
        child: MaterialApp(
          title: 'Ocean Academy',
          builder: (context, child) => MainLayout(
            menubar: LoginResponsive.isLogin
                ? Container(
                    height: 50,
                    color: Colors.red,
                  )
                : ResponsiveMenu(),
            child: child,
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute: HomeRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}

subscribeFailedDialog(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pop(context);
      });
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        content: Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Check your Email',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              Image.asset('images/wrong-symbol.gif'),
            ],
          ),
        ),
      );
    },
  );
}

subscribeDialog(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pop(context);
      });
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        content: Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thanks for Subscribe',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('images/tick-gif.gif'),
            ],
          ),
        ),
      );
    },
  );
}
