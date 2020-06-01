import 'package:flutter/material.dart';
import '../../konstants.dart';

class TextForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Quantity",

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
