import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:xd/Widgets/Buttons/GreenOutLineButtons.dart';
import 'package:xd/Widgets/FormFieldWidgets/LoginCustomFormField.dart';
import 'package:xd/Widgets/Models/ProductsModel.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/Slivers.dart';
import '../konstants.dart';
import 'MessagesPage.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  static const id = "ProductDetails";

  @override
  Widget build(BuildContext context) {
    // final favorite = Provider.of<ThumbsNailModel>(context);
    //final productID = ModalRoute.of(context).settings.arguments as String;
    //final firestoreProducts = Provider.of<FireStoreProducts>(context, listen: false);
    var firestoreProducts = Provider.of<List<FireStoreProducts>>(context);

    //.findById(productID);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 3.0,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => NewPage()));
                  },
                  icon: Icon(
                    Icons.share,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => FavoritesPage(),
                    //   ),
                    // );
                    // favorite.toggleFavoriteStatus();
                    // print(favorite.isFavorite);
                  },
                  icon: Icon(
                      //favorite.isFavorite
                      //? Icons.favorite
                      //:
                      Icons.favorite_border),
                ),
              ],
              title: Text(
                "Products",
                style: kappBarText,
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    // enlargeCenterPage: true,
                    autoPlay: false,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      // decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     image: DecorationImage(
                      //       fit: BoxFit.fitWidth,
                      //        image:
                      //       // NetworkImage(
                      //       //   firestoreProducts[index].imageUrl,
                      //       //   scale: 1,
                      //       // ),
                      //     )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: firestoreProducts[index].imageUrl,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              border: Border(
                                top:
                                    BorderSide(color: Colors.white70, width: 2),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    firestoreProducts[index].title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            OMIcons.locationOn,
                                            size: 15,
                                          ),
                                          Text(
                                            "Lagos, today, 15:51",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        firestoreProducts[index].price,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: firestoreProducts.length),
            ),
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: FlatButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MessagesPage(),
                                ),
                              );
                            },
                            shape: Border.all(width: 2, color: Colors.green),
                            icon: (Icon(
                              OMIcons.message,
                              color: Colors.green,
                            )),
                            label: Text(
                              "Make An offer",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: FlatButton.icon(
                            onPressed: () {},
                            color: Colors.green,
                            icon: (Icon(
                              Icons.call,
                              color: Colors.white,
                            )),
                            label: Text(
                              "call",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton.icon(
                          padding: EdgeInsets.all(8),
                          onPressed: () {},
                          icon: Icon(
                            Icons.assessment,
                            size: 20,
                            color: Colors.green,
                          ),
                          label: Text(
                            "Price history",
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverFixedExtentList(
                itemExtent: 40,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => SliverCard(
                    child: ListTile(
                      dense: true,
                      leading: Text(
                        firestoreProducts[index].title,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 11),
                      ),
                      trailing: Text(
                        firestoreProducts[index].title,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                  childCount: firestoreProducts.length,
                )),
            SliverContainer(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Neat 2012 Honda Accord Sedan, ac working fine car is in very good condition and ready for Family trips and great road jorneys",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: Text(
                  "Delivery",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SliverCard(
                    child: ListTile(
                      leading: Text(
                        "Delivery Within Nigeria",
                      ),
                      trailing: Text("Yes"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      "Store Address",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            SliverContainer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GreenOutLineButton(
                  text: "Request seller to call back",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SliverCard(
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage("assets/images/ppp.jpg"),
                        backgroundColor: Colors.white,
                        // child: Icon(
                        //   OMIcons.accountCircle,
                        //   color: Colors.black45,
                        //   size: 40,
                        // ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        //flex: 2,
                        child: Text(
                          "See all ads",
                          style: TextStyle(color: Colors.green, fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Adefemi Peter",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Last Seen",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SliverCard(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Start chat with seller"),
                      Row(
                        children: <Widget>[
                          GreenOutLineButton(
                            padding: EdgeInsets.all(0),
                            text: "Last Price",
                            style: kgreenoutlinebutton,
                          ),
                          kSizedboxw5,
                          GreenOutLineButton(
                            text: "Is it Available",
                            style: kgreenoutlinebutton,
                          ),
                          kSizedboxw5,
                          GreenOutLineButton(
                            text: "Call me",
                            style: kgreenoutlinebutton,
                          )
                        ],
                      ),
                      CustomFormField(
                        hidePassword: false,
                        height: 40,
                        hintText: "Enter Message Here",
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.amber,
                        minWidth: double.infinity,
                        child: Text(
                          "Start chat",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.flag,
                      size: 14,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Report abuse",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: GreenOutLineButton(
                      text: "Post ad like this",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 20,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text("Similar Ads"),
                  ),
                  kSizedboxh10,
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    color: Colors.green,
                    height: 2,
                  )
                ],
              ),
            ),
            //  SliverListWidget()
          ],
        ),
      ),
    );
  }
}
