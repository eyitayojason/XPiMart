import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xd/Screens/HomePage.dart';
import 'package:xd/Screens/ProductDetails.dart';
import 'package:xd/Screens/categorylist_page.dart';
import 'package:xd/konstants.dart';
import 'CustomProductCard.dart';

import 'Models/ListItems.dart';
import 'Models/ProductThumbsNailModel.dart';

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

class CustomSliverAppBAr extends StatelessWidget {
  const CustomSliverAppBAr({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      centerTitle: true,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Text(
            "What are you looking for?",
            textAlign: TextAlign.center,
            style: khomeappbartitle,
          ),
        ),
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: SliverAppBarTextField(
          icondata: Icons.search,
        ),
      ),
      expandedHeight: 200,
    );
  }
}

class SliverAppBarTextField extends StatelessWidget {
  const SliverAppBarTextField({
    this.iconData,
    this.container,
    this.icondata,
    this.iconData2,
  });

  final Widget container;
  final IconData icondata;
  final IconData iconData;
  final IconData iconData2;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.only(
          bottom: 10,
          left: 5,
          right: 5,
        ),
        height: 40,
        child: TextField(
          cursorWidth: 1.5,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 9),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SliverAppbarTextfieldicons(
              iconData: icondata,
            ),
            SliverAppbarTextfieldicons(
              iconData: Icons.tune,
            ),
          ],
        ),
      ),
    ]);
  }
}

class SliverAppbarTextfieldicons extends StatelessWidget {
  SliverAppbarTextfieldicons({
    this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.green[300],
        ),
      ],
    );
  }
}

class SliverListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverFixedExtentList(
        itemExtent: 150.0,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (index) => ProductDetails(),
                    ));
              },
              child: CustomProductCard(
                price: productThumbsNailsModel[index].price,
                // description: productThumbnails[index].productDescription,
                name: productThumbsNailsModel[index].subtitle,
                box: Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    //   color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      image: AssetImage(
                          productThumbsNailsModel[index].productThumbnails),
                    ),
                  ),
                ),
              ),
            );
            //Container(
            //   alignment: Alignment.center,
            //   child: Text('List Item $index'),
            // );
          },
          childCount: productThumbsNailsModel.length,
          addAutomaticKeepAlives: true,
        ),
      ),
    );
  }
}

class SliverCard extends StatelessWidget {
  SliverCard({this.subtitle, this.child});

  final Widget child;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.4,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: child);
  }
}

class SliverContainer extends StatelessWidget {
  const SliverContainer({this.child, this.text});

  final Widget child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(11),
      sliver: SliverToBoxAdapter(
        child: child,
      ),
    );
  }
}
