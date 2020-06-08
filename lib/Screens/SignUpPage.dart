import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:xd/Screens/LoginPage.dart';
import 'package:xd/Screens/LoginScreen.dart';
import 'package:xd/Widgets/Buttons/LoginButtons.dart';
import 'package:xd/Widgets/FormFieldWidgets/LoginCustomFormField.dart';
import 'package:xd/Widgets/services/Authentication.dart';
import '../konstants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
String email;
String password;
String firstName;
String lastName;
String pHoneNumber;
//bool showSpinner = false;
LoginScreen loginScreen = LoginScreen();

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Authentication>(context);
    return SafeArea(
      child: Scaffold(
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
        body: ModalProgressHUD(
          inAsyncCall: LoginScreen.showSpinner,
          opacity: 0.5,
          color: Colors.black,
          progressIndicator: SpinKitChasingDots(
            color: Colors.redAccent,
            size: 90,
          ),
          child: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset(
                      "assets/images/XPI.png",
                      height: 200,
                    ),
                  ),
                ),
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
                          onChanged: (value) {
                            email = value;
                          },
                          hidePassword: false,
                          hintText: "Email / Phone",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          onChanged: (value) {
                            password = value;
                          },
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
                          onChanged: (value) {
                            firstName = value;
                          },
                          hidePassword: false,
                          hintText: "First name",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          hidePassword: false,
                          hintText: "Last Name",
                          onChanged: (value) {
                            lastName = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          hidePassword: false,
                          hintText: "Phone Number",
                          onChanged: (value) {
                            pHoneNumber = value;
                          },
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
                          onTap: () async {
                            provider.showspinner();
                            //final newUser =
                            await _auth
                                .createUserWithEmailAndPassword(
                                    email: email, password: password)
                                .whenComplete(() {
                              showSubmitRequestSnackBar(context);
                            });
                            provider.stopSpinner();
                          },
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
        ),
      ),
    );
  }
}

showSubmitRequestSnackBar(BuildContext context) async {
  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: "Registration Complete, Proceed to LOGIN",
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.white,
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.green,
  )..show(context).then(
      (r) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
}
