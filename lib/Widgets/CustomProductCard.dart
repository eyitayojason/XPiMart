import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  CustomProductCard({this.box, this.name, this.price, this.description});
  final Container box;
  final String price;
  final String name;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Row(
        children: <Widget>[
          Flexible(child: box),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  //   color: Colors.white,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                ),
                // Container(
                //padding: EdgeInsets.only(top: 5),

                //   child: Text(
                //     description,
                //     style: TextStyle(fontSize: 10, color: Colors.black),
                //   ),
                // ),

                Container(
                  //  color: Colors.white,
                  padding: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Today, 8:41 PM",
                    style: TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    price,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                // Place item name and price here
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 120, left: 150),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: FlatButton.icon(
                color: Colors.white,
                splashColor: Colors.white,
                shape: Border(
                  top: BorderSide(width: 0.1, color: Colors.grey),
                  right: BorderSide(width: 1, color: Colors.grey),
                  left: BorderSide(width: 0, color: Colors.grey),
                  bottom: BorderSide(
                    width: 3,
                    color: Colors.deepPurple[300],
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Colors.black45,
                ),
                label: Text(
                  "Call",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FlatButton.icon(
                color: Colors.white,
                shape: Border(
                    top: BorderSide(width: 0.1, color: Colors.grey),
                    right: BorderSide(width: 1, color: Colors.grey),
                    left: BorderSide(width: 0, color: Colors.grey),
                    bottom: BorderSide(width: 3, color: Colors.green[300])),
                onPressed: () {},
                icon: Icon(
                  Icons.message,
                  color: Colors.black45,
                ),
                label: Text(
                  "Chat",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
