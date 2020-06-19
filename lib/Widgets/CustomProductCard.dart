// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:xd/Screens/ProductDetails.dart';
// import 'package:xd/Widgets/services/products_provider.dart';
// import 'Models/ThumbsNailModels.dart';
// import 'package:provider/provider.dart';

// //final dbRef = FirebaseDatabase.instance

// class CustomProductCard extends StatefulWidget {
//   @override
//   _CustomProductCardState createState() => _CustomProductCardState();
// }

// class _CustomProductCardState extends State<CustomProductCard> {
//   var _isInit = true;
//   @override
//   void initState() {
//     super.initState();
//     // Future.delayed(Duration.zero).then((_) {

//     // });
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_isInit) {
//       Provider.of<Products>(context).getFirestore();
//     }
//     _isInit = false;
//   }

//   Widget build(
//     BuildContext context,
//   ) {
//     final products = Provider.of<ThumbsNailModel>(context, listen: false);
//     var productsprovider = Provider.of<Products>(context);

//     // this is a child of the product list vidget, this is the widget in the product list view that
//     //displays the data itself
//     // i tried using streamBuilder to do it herebut i cant figure it out
//     // here im using dummy data with provider
//     return Stack(
//       children: <Widget>[
//         // RaisedButton(
//         //   color: Colors.green,
//         //   onPressed: () {
//         //     print(product.productThumbnails);
//         //   },
//         // ),
//         InkWell(
//           onTap: () => print(products.productThumbnails),
//           // Navigator.of(context)
//           //     .pushNamed(ProductDetails.id, arguments: product.id),
//           child: Row(
//             children: <Widget>[
//               Flexible(
//                 child: Consumer<ThumbsNailModel>(
//                   builder: (context, product, child) => Container(
//                     margin: EdgeInsets.all(8),
//                     alignment: Alignment.centerLeft,
//                     decoration: BoxDecoration(
//                       //   color: Colors.white,
//                       image: DecorationImage(
//                           fit: BoxFit.scaleDown,
//                           alignment: Alignment.centerLeft,
//                           image: NetworkImage(product.productThumbnails
//                               //productsprovider.convertedbase64
//                               // product.productThumbnails
//                               )),
//                     ),
//                   ),
//                 ),
//               ),
//               Flexible(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Consumer<ThumbsNailModel>(
//                       builder: (context, product, child) => Container(
//                         alignment: Alignment.topLeft,
//                         //   color: Colors.white,
//                         margin: EdgeInsets.only(top: 20),
//                         child: Text(
//                           product.subtitle,
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w900, fontSize: 15),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(bottom: 5),
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         "Today, 8:41 PM",
//                         style: TextStyle(color: Colors.black54, fontSize: 10),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(bottom: 40),
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         "",
//                         //  product.price,""
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(top: 120, left: 150),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: FlatButton.icon(
//                   color: Colors.white,
//                   splashColor: Colors.white,
//                   shape: Border(
//                     top: BorderSide(width: 0.1, color: Colors.grey),
//                     right: BorderSide(width: 1, color: Colors.grey),
//                     left: BorderSide(width: 0, color: Colors.grey),
//                     bottom: BorderSide(
//                       width: 3,
//                       color: Colors.deepPurple[300],
//                     ),
//                   ),
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.call,
//                     color: Colors.black45,
//                   ),
//                   label: Text(
//                     "Call",
//                     style: TextStyle(
//                       color: Colors.black45,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: FlatButton.icon(
//                   color: Colors.white,
//                   shape: Border(
//                       top: BorderSide(width: 0.1, color: Colors.grey),
//                       right: BorderSide(width: 1, color: Colors.grey),
//                       left: BorderSide(width: 0, color: Colors.grey),
//                       bottom: BorderSide(width: 3, color: Colors.green[300])),
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.message,
//                     color: Colors.black45,
//                   ),
//                   label: Text(
//                     "Chat",
//                     style: TextStyle(
//                       color: Colors.black45,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// // class ProductsStream extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: _firestore
// //           .collection("productsnapshots")
// //           .orderBy("timestamp", descending: false)
// //           .snapshots(),
// //       builder: (context, snapshot) {
// //         if (snapshot == null) {
// //           Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         }
// //       },
// //     );
// //   }
// // }
