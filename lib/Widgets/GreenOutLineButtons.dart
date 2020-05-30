import 'package:flutter/material.dart';

class GreenOutLineButton extends StatelessWidget {
  const GreenOutLineButton(
      {this.text, this.style, this.padding, this.function});

  final Function function;
  final EdgeInsetsGeometry padding;
  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: padding,
      onPressed: function,
      shape: Border.all(width: 1, color: Colors.green),
      child: Text(text, textAlign: TextAlign.center, style: style),
    );
  }
}
