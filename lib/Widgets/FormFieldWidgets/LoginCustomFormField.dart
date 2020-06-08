import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xd/Screens/LoginScreen.dart';
import 'package:xd/VALIDATION/SignupValidation.dart';
import 'package:xd/Widgets/services/Authentication.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool hidePassword;
  final double height;
  final EdgeInsetsGeometry margin;
  final Function onChanged;
  final Function validate;
  final String errorText;
  final TextEditingController controller;
  CustomFormField(
      {this.hintText,
      this.hidePassword,
      this.height,
      this.margin,
      this.onChanged,
      this.validate,
      this.errorText,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      child: TextField(
        controller: controller,
        cursorWidth: 1.5,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          errorText: errorText,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
        obscureText: hidePassword,
      ),
    );
  }
}
