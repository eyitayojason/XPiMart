import 'package:flutter/material.dart';
import 'package:xd/Widgets/Buttons/LoginButtons.dart';
import 'package:xd/Widgets/FormFieldWidgets/LoginCustomFormField.dart';
import '../konstants.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 3.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
        iconTheme: IconThemeData().copyWith(
          color: green,
        ),
        title: Text(
          "Sign up",
          style: kappBarText,
        ),
      ),
      body: ListView(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(20),
              elevation: 2,
              shadowColor: black,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Register New User",
                      style: kbottomText4,
                    ),
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFormField(
                      hidePassword: false,
                      hintText: "First name",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      hidePassword: false,
                      hintText: "Last Name",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      hidePassword: false,
                      hintText: "Phone Number",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text:
                              "By Continuing you agree to the Policy and Rules",
                          style: kbottomText3),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LoginButtons(
                      color: green,
                      height: 50,
                      onTap: () {},
                      text: Text(
                        "Register",
                        style: kButtonTextStyle,
                      ),
                      width: 350,
                      icons: (Icon(Icons.check)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
