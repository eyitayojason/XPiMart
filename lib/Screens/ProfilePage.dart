import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/ProfilePageWidgets.dart';
import 'package:xd/Widgets/services/Authentication.dart';
import 'package:xd/konstants.dart';

DropDownVertical dropDownVertical = DropDownVertical();

class ProfilePage extends StatelessWidget {
  static String id = "ProfilePage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Support Team",
          backgroundColor: Colors.green,
          child: Icon(
            FontAwesomeIcons.solidComments,
            color: Colors.white,
            size: 30,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Container(),
          title: Text(
            "My Account",
            style: kappBarText,
          ),
          actions: <Widget>[dropDownVertical.build(context)],
        ),
        bottomNavigationBar: BottomNavBar(),
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.account_circle,
                    size: 80,
                  ),
                ),
                title: Text(
                  "Jason Hayes",
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "jhayes771@gmail.com",
                      style: TextStyle(color: Colors.black54),
                    ),
                    kSizedboxh10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: ProfilePageFlatButton(
                            text: "Premium Services",
                          ),
                        ),
                        kSizedboxw10,
                        Expanded(
                          child: ProfilePageFlatButton(
                            text: "Manager's Help",
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            kSizedboxh10,
            ErrorImage(),
            kSizedboxh10,
            Center(
              child: Text(
                "CHECK INTERNET CONNECTION",
                style: kbottomText4,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropDownVertical {
  static String dropdownValue = 'One';
  Widget build(BuildContext context) {
    var provider = Provider.of<Authentication>(context);
    return DropdownButton<String>(
      value: null,
      icon: Icon(
        Icons.more_vert,
        color: Colors.green,
      ),
      underline: Container(),
      onChanged: (String newValue) {
        provider.dropDownValue(newValue);
        provider.logOut().whenComplete(() {
          exit(0);
        });
      },
      items: <String>["SignOut & Exit"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: InkWell(
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}
