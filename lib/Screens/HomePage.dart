import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:xd/Widgets/Models/ListItems.dart';
import 'package:xd/Widgets/Models/ProductsModel.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/Slivers.dart';
import 'package:xd/konstants.dart';
import 'ProductDetails.dart';
import 'categorylist_page.dart';

ScrollController scrollNavBarController = ScrollController();
bool isScrollingDown = false;
bool show = true;

class HomePage extends StatefulWidget {
  static const id = "HomePage";
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String proddetailid;
  HomePageState({this.proddetailid});

  @override
  Widget build(ctx) {
    var firestoreProducts = Provider.of<List<FireStoreProducts>>(ctx);

    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        bottomNavigationBar: Wrap(
          children: <Widget>[BottomNavBar()],
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
            SliverPadding(
                padding: EdgeInsets.all(8),
                sliver: SliverFixedExtentList(
                  itemExtent: 150,
                  delegate: SliverChildBuilderDelegate((ctx, i) {
                    return Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.of(ctx).pushNamed(
                              ProductDetails.id,
                              arguments: proddetailid),
                          child: Row(
                            children: <Widget>[
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  margin: EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: CachedNetworkImage(
                                      imageUrl: firestoreProducts[i].imageUrl,
                                      filterQuality: FilterQuality.none,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text(
                                        firestoreProducts[i].name,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "Today at 8PM",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 10),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 40),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        firestoreProducts[i].quantity,
                                        //data["quantity"],
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 120, left: 150),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: FlatButton.icon(
                                  color: white,
                                  splashColor: white,
                                  shape: Border(
                                    top: BorderSide(width: 0.1, color: grey),
                                    right: BorderSide(width: 1, color: grey),
                                    left: BorderSide(width: 0, color: grey),
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
                                  color: white,
                                  shape: Border(
                                      top: BorderSide(width: 0.1, color: grey),
                                      right: BorderSide(width: 1, color: grey),
                                      left: BorderSide(width: 0, color: grey),
                                      bottom: BorderSide(
                                          width: 3, color: Colors.green[300])),
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
                      ],
                    );
                  }, childCount: firestoreProducts.length),
                ))
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    // sub = db
    //     .collection("Products")
    //     .document("xeFVUJsMoFdM4QZ0o9vx")
    //     .snapshots()
    //     .listen((snap) {
    //   data = snap.data;
    // });
//   myScroll();
  }

  @override
  void dispose() {
    myScroll();
    //sub.cancel();

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

  final db = Firestore.instance;
  StreamSubscription sub;
  Map data;
}
