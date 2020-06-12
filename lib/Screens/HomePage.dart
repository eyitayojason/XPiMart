import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/Slivers.dart';

ScrollController scrollNavBarController = ScrollController();
bool isScrollingDown = false;
bool show = true;

class HomePage extends StatefulWidget {
  // static HomePage id = HomePage();
  static const id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    myScroll();
  }

  void showNavBar() {
    setState(() {
      show = true;
    });
  }

  void hideNavBar() {
    setState(() {
      show = false;
    });
  }

  myScroll() {
    scrollNavBarController.addListener(() {
      if (scrollNavBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;

          hideNavBar();
        }
      }
      if (scrollNavBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;

          showNavBar();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: show ? 56.0 : 0.0,
            child: Wrap(
              children: <Widget>[BottomNavBar()],
            ),
          ),
          body: SliverCustomScrollView()),
    );
  }
}
