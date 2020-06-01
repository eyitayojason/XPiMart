import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../konstants.dart';
import 'Provider.dart';

class FormFieldWidget {
  buildItem(BuildContext context, int index) {
    var provider = Provider.of<PostAdProvider>(context);
    return FormField(
      builder: (FormFieldState<String> state) {
        return DropdownButtonFormField(
          items: provider.category.map((String category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (newValue) {
            // do other stuff with _category
            provider.dropdownState(newValue);
          },
          value: provider.category[index],
          decoration: InputDecoration(
            labelText: "Category",
            labelStyle: TextStyle(color: green, fontSize: 25),
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),

            hintStyle: TextStyle(color: green, fontSize: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ), //   isEmpty: currentSelectedValue == true,
            //   isFocused: currentSelectedValue == true,
          ),
        );
      },
    );
  }
}
