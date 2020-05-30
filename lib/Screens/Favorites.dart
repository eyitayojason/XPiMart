import 'package:flutter/material.dart';
import 'package:xd/Widgets/BottomNavBar.dart';
import 'package:xd/Widgets/ProfilePageWidgets.dart';
import 'package:xd/Widgets/Slivers.dart';

class FavoritesPage extends StatefulWidget {
  static String id = "Favorites";

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool focus1 = false;
  bool focus2 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(),
          actions: <Widget>[
            Expanded(
              child: MessagePageAppBarButton(
                buttonText: "Favorites",
                textColor: focus1 ? Colors.green[300] : Colors.black45,
                onPressed: () {
                  setState(() {
                    focus1 = true;
                    focus2 = false;
                  });
                },
              ),
            ),
            Expanded(
              child: MessagePageAppBarButton(
                buttonText: "Subscribing",
                textColor: focus2 ? Colors.green[300] : Colors.black45,
                onPressed: () {
                  setState(() {
                    focus2 = true;
                    focus1 = false;
                  });
                },
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 20,
                ),
                alignment: Alignment.centerLeft,
                child: Text("There are 5 Items in your Favorites"),
              ),
            ),
            //kSizedboxh10,
            SliverPadding(
              padding: EdgeInsets.only(top: 10),
              sliver: SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  color: Colors.green,
                  height: 2,
                ),
              ),
            ),
            SliverListWidget()
          ],
        ),
      ),
    );
  }
}
