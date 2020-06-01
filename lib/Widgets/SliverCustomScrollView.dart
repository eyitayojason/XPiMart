import 'package:flutter/material.dart';
import 'package:xd/Screens/HomePage.dart';
import 'package:xd/Screens/categorylist_page.dart';
import 'package:xd/Widgets/Slivers.dart';
import 'Models/ListItems.dart';

class SliverCustomScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryListPage(
                              products: products[index],
                            )));
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    products[index].productSubtitle,
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
                    color: Colors.grey.shade300,
                  ),
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.scaleDown,
                    image: AssetImage(
                      products[index].productIcons,
                    ),
                  ),
                ),
              ),
            );
          }, childCount: products.length),
        ),
        SliverListWidget(),
      ],
    );
  }
}
