import 'package:flutter/material.dart';
import '../konstants.dart';

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

class ErrorImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/error.jpg",
      height: 250,
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
      //  () {
      //             provider.focus2 = true;
      //             provider.focus1 = false;
      //           },
      textColor: textColor,
      child: Text(buttonText),
    );
  }
}
