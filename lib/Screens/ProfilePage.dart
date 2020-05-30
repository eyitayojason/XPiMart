import 'package:flutter/material.dart';
import 'package:xd/Widgets/BottomNavBar.dart';
import 'package:xd/Widgets/ProfilePageWidgets.dart';
import 'package:xd/konstants.dart';

class ProfilePage extends StatelessWidget {
  static String id = "ProfilePage";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            child: Icon(
              Icons.chat,
              size: 30,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "My Account",
              style: kappBarText,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.green,
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                //blurRadius: 0.2,
                                spreadRadius: 0.2)
                          ],
                        ),
                        width: double.infinity,
                      ),
                      Column(
                        children: <Widget>[
                          ProfileText(
                            text: "Akinjide Obi Musa",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ProfileText(
                            text: "MusaAkinjide@gmail.com",
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 80,
                                ),
                              ),
                              Expanded(
                                child: ProfilePageFlatButton(
                                  text: "Premium Services",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ProfilePageFlatButton(
                                  text: "Manager's Help",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(),
          body: ListView(
            children: <Widget>[
              ErrorImage(),
              Center(
                  child: Text(
                "CHECK INTERNET CONNECTION",
                style: kbottomText4,
              ))
            ],
          )),
    );
  }
}
