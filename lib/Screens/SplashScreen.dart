import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xd/Screens/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
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
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage(
                    "assets/images/XPI.png",
                  ),
                  fit: BoxFit.scaleDown,
                )),
              ),
            ),
            Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 100,
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(bottom: 50),
            //   child: Text(
            //     "Welcome To XPI Mart",
            //     style: TextStyle(
            //         color: Colors.,
            //         fontSize: 30,
            //         fontFamily: "Schyler"),
            //   ),
            //   alignment: Alignment.bottomCenter,
            // )
          ],
        ),
      ),
    );
  }
}
