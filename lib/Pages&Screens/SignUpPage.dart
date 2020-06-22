import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:xd/Services&Providers/Authentication.dart';
import 'package:xd/Services&Providers/SignupValidation.dart';
import 'package:xd/Widgets/Buttons/LoginButtons.dart';
import 'package:xd/Widgets/FormFieldWidgets/LoginCustomFormField.dart';
import '../konstants.dart';
import 'LoginPage.dart';
import 'LoginScreen.dart';

LoginScreen loginScreen = LoginScreen();

class SignUpPage extends StatefulWidget {
  static const id = "SignUpPage";
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController firstnameController =
      TextEditingController();
  static final TextEditingController lastnameController =
      TextEditingController();
  static final TextEditingController phoneController = TextEditingController();

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  initState() {
    super.initState();
  }

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
          color: Colors.redAccent,
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
              "Sign up",
              style: kappBarText,
            ),
          ),
          body: ListView(children: <Widget>[
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
                // Hero(
                //   tag: "teddy",
                //   child: Container(
                //       height: 200,
                //       padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                //       child: FlareActor(
                //         "assets/images/Teddy.flr",
                //         //  shouldClip: false,
                //         animation: "Angry",
                //         alignment: Alignment.bottomCenter,
                //         fit: BoxFit.contain,
                //         controller: _teddyController,
                //       )),
                // ),
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
                          style: kbottomText4.copyWith(fontSize: 20),
                        ),
                        kSizedboxh10,
                        Divider(
                          color: Colors.green.shade200,
                        ),
                        kSizedboxh20,
                        CustomFormField(
                          controller: SignUpPage.emailController,
                          onChanged: (String value) {
                            validate.validateEmail(value);
                          },
                          errorText: validate.email.error,
                          hidePassword: false,
                          hintText: "Email / Phone",
                        ).build(context),
                        kSizedboxh20,
                        CustomFormField(
                          errorText: validate.password.error,
                          controller: SignUpPage.passwordController,
                          onChanged: (String value) {
                            validate.validatePassword(value);
                          },
                          hintText: "Password",
                          hidePassword: true,
                        ).build(context),
                        kSizedboxh20,
                        Text(
                          "Never disclose your password to anyone",
                          style: TextStyle(color: Colors.black38, fontSize: 10),
                        ),
                        kSizedboxh20,
                        CustomFormField(
                          controller: SignUpPage.firstnameController,
                          errorText: validate.firstName.error,
                          onChanged: (String value) {
                            validate.validatefirstName(value);
                          },
                          hidePassword: false,
                          hintText: "First name",
                        ).build(context),
                        kSizedboxh20,
                        CustomFormField(
                          errorText: validate.lastName.error,
                          controller: SignUpPage.lastnameController,
                          hidePassword: false,
                          hintText: "Last Name",
                          onChanged: (String value) {
                            validate.validatelastName(value);
                          },
                        ).build(context),
                        kSizedboxh20,
                        CustomFormField(
                          errorText: validate.phoneNumber.error,
                          controller: SignUpPage.phoneController,
                          hidePassword: false,
                          hintText: "Phone Number",
                          onChanged: (String value) {
                            validate.validatePhone(value);
                          },
                        ).build(context),
                        SizedBox(
                          height: 50,
                        ),
                        RichText(
                          text: TextSpan(
                              text:
                                  "By Continuing you agree to the Policy and Rules",
                              style: kbottomText3),
                        ),
                        kSizedboxh10,
                        LoginButtons(
                          color: green,
                          height: 50,
                          onTap: () async {
                            try {
                              if (validate.isValid == true) {
                                provider.showspinner();
                                provider.signUp().whenComplete(() {
                                  provider.stopSpinner();
                                  provider.success
                                      ? showSuccessSnackBar(context)
                                      : showFailedSnackBar(context);
                                });
                              } else {}
                            } catch (e) {
                              print(e);
                            }
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

showSuccessSnackBar(BuildContext context) async {
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
  )..show(context).then((r) => Navigator.pushNamed(context, LoginPage.id));
}

showFailedSnackBar(BuildContext context) async {
  var provider = Provider.of<Authentication>(context, listen: false);
  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: "Registration Failed, Please Try Again",
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.red,
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.green,
  )..show(context).then((context) => {}).whenComplete(() {
      provider.stopSpinner();
    });
}
