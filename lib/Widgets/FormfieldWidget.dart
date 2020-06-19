import 'package:flutter/material.dart';
import '../konstants.dart';

class FormFieldWidget {
  Function onChanged;
  var dropDownButtonFormFieldvalue;
  var dropdownMenuItemvalue;
  var category;
  List<DropdownMenuItem<String>> items;
  FormFieldWidget(
      {this.onChanged,
      this.category,
      this.items,
      this.dropDownButtonFormFieldvalue,
      this.dropdownMenuItemvalue});
  Widget build(BuildContext context, int index) {
    return DropdownButtonFormField(
        items: items,
        onChanged: onChanged,
        value: dropDownButtonFormFieldvalue,
        decoration: InputDecoration(
          labelText: "Category",
          labelStyle: TextStyle(color: green, fontSize: 25),
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),

          hintStyle: TextStyle(color: green, fontSize: 25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ), //   isEmpty: currentSelectedValue == true,
          //   isFocused: currentSelectedValue == true,
        ));
  }
}
