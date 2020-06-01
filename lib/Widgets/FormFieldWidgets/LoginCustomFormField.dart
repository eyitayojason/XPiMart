import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool hidePassword;
  final double height;
  final EdgeInsetsGeometry margin;
  CustomFormField({this.hintText, this.hidePassword, this.height, this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      child: TextField(
        cursorWidth: 1.5,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
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
