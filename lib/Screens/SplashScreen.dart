import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xd/Screens/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static const id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, LoginScreen.id));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: SpinKitWave(
                color: Colors.greenAccent,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
