import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xd/Models/ListItems.dart';
import 'package:xd/Widgets/CustomSliverList.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/Slivers.dart';
import 'package:xd/konstants.dart';
import 'categorylist_page.dart';

bool isScrollingDown = false;
bool show = true;
final db = Firestore.instance;
final ScrollController scrollNavBarController = ScrollController();

class HomePage extends StatefulWidget {
  static const id = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    myScroll();
    scrollNavBarController.removeListener(() {});
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

  myScroll() async {
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
  Widget build(ctx) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: show ? 55.0 : 0.0,
          child: Wrap(
            children: <Widget>[
              BottomNavBar(),
            ],
          ),
        ),
        body: CustomScrollView(
          controller: scrollNavBarController,
          slivers: <Widget>[
            CustomSliverAppBAr(),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 0.5,
                crossAxisSpacing: 0.5,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate((ctx, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      ctx,
                      MaterialPageRoute(
                        builder: (ctx) => CategoryListPage(
                          products: productsicon[i],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        productsicon[i].productSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: grey.shade300,
                      ),
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.scaleDown,
                        image: AssetImage(
                          productsicon[i].productIcons,
                        ),
                      ),
                    ),
                  ),
                );
              }, childCount: productsicon.length),
            ),
            CustomSliverList().build(ctx)
          ],
        ),
      ),
    );
  }
}
