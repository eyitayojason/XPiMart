import 'package:flutter/material.dart';
import '../../konstants.dart';

class TextForm extends StatelessWidget {
  TextForm({this.onChanged, this.labeltext, this.controller});
  final TextEditingController controller;
  final Function onChanged;
  final String labeltext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labeltext,

        labelStyle: TextStyle(color: grey, fontSize: 20),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
        //  hintText: 'Please select expense',
        hintStyle: TextStyle(color: green, fontSize: 25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ), //   isEmpty: currentSelectedValue == true,
        //   isFocused: currentSelectedValue == true,
      ),
    );
  }
}
