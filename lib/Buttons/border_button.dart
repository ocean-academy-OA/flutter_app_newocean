import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  BorderButton({
    this.onPressed,
    this.buttonName = 'BorderButton',
    this.borderColor = Colors.blue,
    this.borderWidth = 1,
    this.fillColor = Colors.white,
    this.hoverColor = Colors.blue,
    this.textColor = Colors.black,
    this.buttonWidth,
    this.margin,
  });
  Function onPressed;
  String buttonName;
  double borderWidth;
  double buttonWidth;
  Color fillColor;
  Color borderColor;
  Color hoverColor;
  Color textColor;
  EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: FlatButton(
          hoverColor: hoverColor,
          height: 45,
          minWidth: buttonWidth,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
          color: fillColor,
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}
