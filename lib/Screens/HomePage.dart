import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xd/Widgets/BottomNavBar.dart';
import 'package:xd/Widgets/Slivers.dart';
import '../konstants.dart';

ScrollController scrollNavBarController = ScrollController();
bool isScrollingDown = false;

bool show = true;

double navBarHeight;

class HomePage extends StatefulWidget {
  static String id = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    myScroll();
  }

  void _incrementTab(index) {
    setState(() {
      selectedpage = index;
    });
  }

  @override
  void dispose() {
    scrollNavBarController.removeListener(() {});
    super.dispose();
    // TODO: implement dispose
    super.dispose();
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
    setState(() {
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
              children: <Widget>[
                BottomNavBar(
                  onTap: (index) {
                    setState(() {
                      _incrementTab(index);
                    });
                  },
                )
              ],
            ),
          ),
          body: SliversCustomScrollView()),
    );
  }
}
