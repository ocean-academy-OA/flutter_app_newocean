import 'package:flutter/material.dart';

class RectangularMaterialButton extends StatelessWidget {
  RectangularMaterialButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        icon,
        color: Colors.white,
        size: 14,
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 30.0,
        height: 30.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      fillColor: Color(0xff0091d2),
    );
  }
}
