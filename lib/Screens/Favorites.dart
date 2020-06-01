import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/ProfilePageWidgets.dart';
import 'package:xd/Widgets/Provider.dart';
import 'package:xd/Widgets/Slivers.dart';

class FavoritesPage extends StatelessWidget {
  static String id = "Favorites";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavoritesProvider>(context);
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
                textColor: provider.focus1 ? Colors.green[300] : Colors.black45,
                onPressed: () {
                  provider.focusset();
                },
              ),
            ),
            Expanded(
              child: MessagePageAppBarButton(
                buttonText: "Subscribing",
                textColor: provider.focus2 ? Colors.green[300] : Colors.black45,
                onPressed: () {
                  provider.focusset2();
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
