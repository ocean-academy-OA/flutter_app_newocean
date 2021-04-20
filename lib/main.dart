import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Login_Menubar/responsive_login_menu.dart';

import 'package:flutter_app_newocean/Menu/ResponsiveMenu.dart';
import 'package:flutter_app_newocean/getx_controller.dart';
import 'package:flutter_app_newocean/layout_builder.dart';
import 'package:flutter_app_newocean/route/Provider/provider_routing.dart';
import 'package:flutter_app_newocean/route/dynamic_routing.dart';
import 'package:flutter_app_newocean/route/navigation_locator.dart';
import 'package:flutter_app_newocean/route/navigation_service.dart';
import 'package:flutter_app_newocean/route/routeNames.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // GestureBinding.instance.resamplingEnabled = true;
  setupLocator();
  setPathUrlStrategy();
  Get.put(ValueListener());
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final valueController = Get.find<ValueListener>();
  String session;
  // This widget is the root of your application.
  sessionCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    session = (prefs.getString('user') ?? null);
  }

  @override
  Widget build(BuildContext context) {
    sessionCheck();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SliderContent()),
          ChangeNotifierProvider(create: (context) => UpcomingModel()),
        ],
        child: GetMaterialApp(
          title: 'Ocean Academy',
          builder: (context, child) => MainLayout(
            menubar: Obx(
              () => valueController.navebars.value == 'Login'
                  ? ResponsiveLoginMenu()
                  : ResponsiveMenu(),
            ),
            child: child,
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute:
              session == null ? HomeRoute : '/ClassRoom?userNumber=$session',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
