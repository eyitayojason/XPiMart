import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xd/Screens/Favorites.dart';
import 'package:xd/Screens/HomePage.dart';
import 'package:xd/Screens/MessagesPage.dart';
import 'package:xd/Screens/PostAdPage.dart';
import 'package:xd/Screens/ProfilePage.dart';
import '../konstants.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'BottomNavProvider.dart';

final pages = [
  HomePage(),
  FavoritesPage(),
  PostAdPage(),
  MessagesPage(),
  ProfilePage(),
];
final items = [
  BottomNavigationBarItem(
    icon: Icon(OMIcons.home),
    title: Text(
      "Home",
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.star_border),
    title: Text(
      "Favorite",
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      OMIcons.addBox,
    ),
    title: Text(
      "Sell",
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(OMIcons.message),
    title: Text(
      "Messages",
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(OMIcons.accountCircle),
    title: Text(
      "Profile",
    ),
  )
];

class BottomNavBar extends StatelessWidget {
  BottomNavBar({this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return BottomNavigationBar(
        iconSize: 20,
        elevation: 4,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: kButtomNavBarText,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData().copyWith(
          color: Colors.green,
          size: 25,
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        unselectedIconTheme:
            IconThemeData().copyWith(color: Colors.black, size: 20),
        onTap: (index) {
          // selectedpage = index;
          provider.currentIndex = index;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => pages[provider.currentIndex]));
        },
        items: items);
  }
}
