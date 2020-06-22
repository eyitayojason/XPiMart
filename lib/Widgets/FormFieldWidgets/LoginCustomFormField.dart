import 'package:flutter/material.dart';

typedef void CaretMoved(Offset globalCaretPosition);
typedef void TextChanged(String text);

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool hidePassword;
  final double height;
  final Key key;
  final EdgeInsetsGeometry margin;
  final Function onChanged;
  final Function validate;
  final CaretMoved onCaretMoved;
  final TextChanged onTextChanged;
  final String errorText;
  final TextEditingController controller;
  CustomFormField(
      {this.hintText,
      this.onCaretMoved,
      this.onTextChanged,
      this.hidePassword,
      this.height,
      this.margin,
      this.onChanged,
      this.validate,
      this.key,
      this.errorText,
      this.controller});

  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      child: TextFormField(
        controller: controller,
        key: key,
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
