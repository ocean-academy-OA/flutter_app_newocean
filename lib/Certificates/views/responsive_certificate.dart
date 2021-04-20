import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Certificates/desktop_certificate.dart';
import 'package:flutter_app_newocean/Certificates/mobile_certificate.dart';
import 'package:flutter_app_newocean/Certificates/tablet_certificate.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveCertificate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: DesktopCertificate(),
      tablet: TabletCertificate(),
      mobile: MobileCertificate(),
    );
  }
}
