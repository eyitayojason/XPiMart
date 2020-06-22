import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xd/konstants.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static const id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
        () => Navigator.pushNamed(context, LoginScreen.id));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                child: Image.asset(
                  "assets/images/XPI.png",
                ),
              ),
            ),
            kSizedboxh20,
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: SpinKitThreeBounce(
                color: Colors.green,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
