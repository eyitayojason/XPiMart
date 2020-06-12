import 'package:flutter/material.dart';
import 'package:xd/Widgets/Models/ListItems.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/Slivers.dart';
import 'CategoryListPage2.dart';

class CategoryListPage extends StatelessWidget {
  static const id = "CategoryListPage";

  CategoryListPage({this.products});

  final ProductsModel products;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFixedAppBar(),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryListPage2.id);
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  leading: Container(
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          vehiclescategorythumb[index].productIcons,
                        ),
                      ),
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Icon(
                      vehiclescategorythumb[index].arrow,
                      color: Colors.blueGrey.shade300,
                      size: 14,
                    ),
                  ),
                  title: Text(vehiclescategorythumb[index].productTitle),
                  subtitle: Text(vehiclescategorythumb[index].productSubtitle),
                );
              }, childCount: vehiclescategorythumb.length),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverFixedAppBar extends StatelessWidget {
  const SliverFixedAppBar({this.iconData, this.icondata, this.iconButton});
  final IconData iconData;
  final IconData icondata;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverAppBar(
        iconTheme: IconThemeData(opacity: 0.0),
        expandedHeight: 90,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          centerTitle: true,
          title: SliverAppBarTextField(
            icondata: Icons.arrow_back,
            iconData: iconData,
          ),
        ),
      ),
    );
  }
}
