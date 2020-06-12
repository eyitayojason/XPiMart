import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:xd/Screens/HomePage.dart';
import 'package:xd/Widgets/Buttons/LoginButtons.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/services/Authentication.dart';
import '../konstants.dart';
import 'LoginPage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'SignUpPage.dart';

Authentication authentication = Authentication();
LoginButtons loginButtons = LoginButtons();

class LoginScreen extends StatelessWidget {
  static const id = "LoginScreen";
  static bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Authentication>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: ModalProgressHUD(
          opacity: 0.5,
          color: Colors.black,
          progressIndicator: SpinKitChasingDots(
            color: Colors.green,
            size: 90,
          ),
          inAsyncCall: showSpinner,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  child: Image.asset(
                    "assets/images/XPI.png",
                    height: 50,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: const AssetImage("assets/images/womanbag.jpg"),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      LoginButtons(
                        onTap: () async {
                          provider.showspinner();
                          await provider.handleSignIn().whenComplete(
                            () {
                              Navigator.pushNamed(context, HomePage.id);
                              provider.stopSpinner();
                            },
                          );
                        },
                        height: 40,
                        width: 350,
                        text: Text(
                          "Log in with Google",
                          style: kButtonTextStyle,
                        ),
                        color: const Color(0xffff0000),
                        icons: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                      ),
                      LoginButtons(
                        onTap: () {
                          provider.showspinner();
                          provider.login().whenComplete(() {
                            Navigator.pushNamed(context, HomePage.id);
                            provider.stopSpinner();
                          });
                        },
                        height: 40,
                        width: 350,
                        icons: Icon(
                          Icons.add_to_home_screen,
                          color: Colors.white,
                        ),
                        text: Text(
                          "Log in with Facebook",
                          style: kButtonTextStyle,
                        ),
                        color: const Color(0xff0a62ac),
                      ),
                      LoginButtons(
                        height: 40,
                        width: 350,
                        color: Colors.brown,
                        icons: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        text: Text(
                          "Log in with email or phone",
                          style: kButtonTextStyle,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                      ),
                      kSizedboxh10,
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, SignUpPage.id),
                        child: RichText(
                          text: TextSpan(
                              text: "Dont have an account? ",
                              children: [
                                TextSpan(text: "Sign Up", style: kbottomText),
                              ]),
                        ),
                      ),
                      kSizedboxh15,
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text:
                                  "By Continuing you agree to the Policy and Rules",
                              style: kbottomText),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
