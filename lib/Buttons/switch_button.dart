import 'package:flutter/material.dart';

import 'package:fswitch/fswitch.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SwitchButton extends StatelessWidget {
  SwitchButton({this.onChanged, this.open = false});

  Function onChanged;
  bool open;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: FSwitch(
        open: open,
        width: 300,
        height: 50,
        closeChild: Container(
          width: 275,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Online',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ),
        openChild: Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Offline',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ),
        color: Colors.blue,
        openColor: Colors.blue[800],
        onChanged: onChanged,
      ),
    );
    LiteRollingSwitch(
        //initial value
        value: open,
        textOn: 'disponible',
        textOff: 'ocupado',
        colorOn: Colors.greenAccent[700],
        colorOff: Colors.redAccent[700],
        iconOn: Icons.done,
        iconOff: Icons.remove_circle_outline,
        textSize: 16.0,
        onChanged: onChanged);
  }
}

// AdvancedSwitch(
// controller: switchContreller,
// activeChild: Text('Online'),
// inactiveChild: Text('Offline'),
// inactiveColor: Colors.blue[800],
// activeColor: Colors.blue,
// width: 80,
// ),
