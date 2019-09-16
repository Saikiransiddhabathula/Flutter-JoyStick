import 'dart:async';

import 'package:control_pad/models/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:control_pad/control_pad.dart';

Future<void>main() async{
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]);

  runApp(MainScreen());

}
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control Pad Example',
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    JoystickDirectionCallback onDirectionChanged(
      double degrees, double distance) {
      print(
        "Degree : ${degrees.toStringAsFixed(2)}, Distance : ${distance.toStringAsFixed(2)}  ");


    }

    PadButtonPressedCallback padButtonPressedCallback(
      int buttonIndex, Gestures gesture){
      print("ButtonIndex : ${buttonIndex}");

    }




    return Scaffold(
      appBar: AppBar(
        title: Text("JoyStick"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            JoystickView(
              onDirectionChanged: onDirectionChanged,
            ),
            PadButtonsView(
              padButtonPressedCallback: padButtonPressedCallback,
            ),
          ],
        ),
        ),

    );
  }
}




//
//
//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Joystick'),
//      ),
//      body: Container(
//
//        color: Colors.white,
//
//        child: JoystickView(),
//
//
//
//      ),
//    );
//  }
//}


