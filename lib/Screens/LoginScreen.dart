import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xd/Widgets/Buttons/LoginButtons.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import '../konstants.dart';
import 'LoginPage.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Container(
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
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 300, right: 250),
                    child: Container(
                      child: Hero(
                        tag: "logo",
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            "assets/images/XPI.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                LoginButtons(
                  onTap: () {},
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(text: "Dont have an account? ", children: [
                    TextSpan(text: "Sign Up", style: kbottomText),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: "By Continuing you agree to the Policy and Rules",
                        style: kbottomText),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
