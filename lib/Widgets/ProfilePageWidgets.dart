import 'package:flutter/material.dart';

class ProfilePageFlatButton extends StatelessWidget {
  const ProfilePageFlatButton({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      color: Colors.green,
    );
  }
}

class MessagePageAppBarButton extends StatelessWidget {
  const MessagePageAppBarButton(
      {this.onPressed, this.textColor, this.buttonText});

  final Color textColor;
  final Function onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      textColor: textColor,
      child: Text(buttonText),
    );
  }
}
