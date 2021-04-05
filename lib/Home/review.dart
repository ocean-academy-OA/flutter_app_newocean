import 'package:flutter/material.dart';
import 'package:flutter_app_newocean/Home/google_review.dart';
import 'package:flutter_app_newocean/Home/justdial.dart';
import 'package:flutter_app_newocean/Home/trust_piolet.dart';

class ReView extends StatefulWidget {
  @override
  _ReViewState createState() => _ReViewState();
}

class _ReViewState extends State<ReView> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 40,
      runSpacing: 40.0,
      children: [
        GoogleReview(),
        JusDialReview(),
        TrustPilotReview(),
      ],
    );
  }
}
