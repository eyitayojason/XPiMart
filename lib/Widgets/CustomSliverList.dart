import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xd/Models/ProductsModel.dart';
import 'package:xd/Pages&Screens/ProductDetails.dart';
import '../konstants.dart';

class CustomSliverList {
  Widget build(BuildContext context) {
    var firestoreProducts = Provider.of<List<FireStoreProducts>>(context);

    return SliverPadding(
        padding: EdgeInsets.all(8),
        sliver: SliverFixedExtentList(
            itemExtent: 150,
            delegate: SliverChildBuilderDelegate((ctx, i) {
              return Stack(
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.of(ctx).pushNamed(
                      ProductDetails.id,
                    ),
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
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      color: Colors.black54, fontSize: 10),
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
            }, childCount: firestoreProducts.length)));
  }
}
