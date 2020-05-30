import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons(
      {this.icons, this.onTap, this.text, this.color, this.height, this.width});

  final Icon icons;
  final Text text;
  final Color color;
  final Function onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        //fit: BoxFit.fitHeight,
        //alignment: Alignment.bottomCenter,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icons,
              SizedBox(
                width: 10,
              ),
              text,
            ],
          ),
          height: height,
          width: width,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
