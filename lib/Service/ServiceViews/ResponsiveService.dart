import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Service/ServiceViews/desktop_service.dart';
import 'package:flutter_app_newocean/Service/ServiceViews/tab_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: TabService(),
      desktop: DesktopService(),
      tablet: TabService(),
    );
  }
}
