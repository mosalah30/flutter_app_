import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {


  void _navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/HomePage');
  }

  _startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, _navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    _startSplashScreenTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: new Container(
      color: Colors.redAccent,
      child: Center(
        child: Text("NEWS APP",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                textBaseline: TextBaseline.alphabetic)),
      ),
    ));
  }
}
