import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Thanks_Purchase/desktop_thanks_for_purchase.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveThanksForPurchase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DesktopThanksForPurchasing(),
      desktop: DesktopThanksForPurchasing(),
      tablet: DesktopThanksForPurchasing(),
    );
  }
}
