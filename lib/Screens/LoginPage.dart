import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:xd/Screens/LoginScreen.dart';
import 'package:xd/VALIDATION/SignupValidation.dart';
import 'package:xd/Widgets/Buttons/LoginButtons.dart';
import 'package:xd/Widgets/FormFieldWidgets/LoginCustomFormField.dart';
import 'package:xd/Widgets/services/Authentication.dart';
import 'package:xd/konstants.dart';
import 'HomePage.dart';
import 'SignUpPage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

String email;
String password;

//final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatelessWidget {
  static const id = "LoginPage";
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Authentication>(context);
    var validate = Provider.of<Validation>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: LoginScreen.showSpinner,
        opacity: 0.5,
        color: Colors.black,
        progressIndicator: SpinKitChasingDots(
          color: Colors.blue,
          size: 90,
        ),
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
                  Hero(
                    tag: "logo",
                    child: Container(
                      child: Image.asset(
                        "assets/images/XPI.png",
                        height: 300,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(20),
                    elevation: 1,
                    shadowColor: black,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.black12,
                          ),
                          kSizedboxh20,
                          CustomFormField(
                            controller: emailController,
                            onChanged: (String value) {
                              validate.validateEmail(value);
                            },
                            errorText: validate.email.error,
                            hidePassword: false,
                            hintText: "Email / Phone",
                          ),
                          kSizedboxh20,
                          CustomFormField(
                            controller: passwordController,
                            onChanged: (String value) {
                              validate.validatePassword(value);
                            },
                            hintText: "Password",
                            errorText: validate.password.error,
                            hidePassword: true,
                          ),
                          kSizedboxh20,
                          Text(
                            "Never disclose your password to anyone",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 10),
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
                            color: green,
                            height: 60,
                            width: 200,
                            onTap: () async {
                              if (validate.isValid == true) {
                                provider.showspinner();
                                provider
                                    .signInWithEmailAndPassword()
                                    .whenComplete(() {
                                  provider.stopSpinner();
                                  provider.success
                                      ? showSucessSnackBar(context)
                                      : showLoginFailedSnackBar(context);
                                });
                              } else {}
                            },
                            text: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: white,
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
                              style: TextStyle(color: green),
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
                    Navigator.pushNamed(context, SignUpPage.id);
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
      ),
    );
  }
}

showSucessSnackBar(BuildContext context) async {
  var provider = Provider.of<Authentication>(context, listen: false);
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    message: "Welcome$email",
    showProgressIndicator: true,
    flushbarStyle: FlushbarStyle.FLOATING,
    blockBackgroundInteraction: true,
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.white,
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.green,
  )..show(context)
        .then((r) => Navigator.pushNamed(context, HomePage.id))
        .whenComplete(() {
      provider.stopSpinner();
    });
}

showLoginFailedSnackBar(BuildContext context) async {
  var provider = Provider.of<Authentication>(context, listen: false);
  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: "Login Failed Try Again",
    flushbarStyle: FlushbarStyle.GROUNDED,
    blockBackgroundInteraction: true,
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.red,
    ),
    backgroundColor: green,
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: green,
  )..show(context).then((contex) => {}).whenComplete(() {
      provider.stopSpinner();
    });
}
//  Flushbar(
//     flushbarPosition: FlushbarPosition.BOTTOM,
//     message: "Login Failed Try Again",
//     flushbarStyle: FlushbarStyle.GROUNDED,
//     blockBackgroundInteraction: true,
//     icon: Icon(
//       Icons.info_outline,
//       size: 28.0,
//       color: Colors.red,
//     ),
//     backgroundColor: Colors.green,
//     duration: Duration(seconds: 3),
//     leftBarIndicatorColor: Colors.green,
//   )
