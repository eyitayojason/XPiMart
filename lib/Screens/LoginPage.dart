import 'package:flutter/material.dart';
import 'package:xd/Widgets/CustomFormField.dart';
import 'package:xd/Widgets/LoginButtons.dart';
import 'package:xd/konstants.dart';
import 'HomePage.dart';
import 'SignUpPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3.0,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )
          ],
          iconTheme: IconThemeData().copyWith(
            color: Colors.green,
          ),
          title: Text(
            "Sign In",
            style: kappBarText,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 1,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Sign In"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          hidePassword: false,
                          hintText: "Email / Phone",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          hintText: "Password",
                          hidePassword: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Never disclose your password to anyone",
                          style: TextStyle(color: Colors.black38, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: LoginButtons(
                          color: Colors.green,
                          height: 60,
                          width: 200,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          text: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          icons: (Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
           kSizedboxh20,
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: RichText(
                  text: TextSpan(
                      text: "Dont have an account? ",
                      style: kbottomText2,
                      children: [
                        TextSpan(text: "Sign Up", style: kbottomText2)
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
