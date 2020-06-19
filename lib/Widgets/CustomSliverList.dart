// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:xd/Screens/ProductDetails.dart';

// import '../konstants.dart';
// import 'Models/ProductsModel.dart';

// class ProductsList extends StatelessWidget {
//   const ProductsList({
//     Key key,
//     this.proddetailid,
//     @required this.firestoreProducts,
//   }) : super(key: key);

//   final String proddetailid;
//   final List<FireStoreProducts> firestoreProducts;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SliverPadding(
//           padding: EdgeInsets.all(8),
//           sliver: SliverFixedExtentList(
//             itemExtent: 150,
//             delegate:
//                 SliverChildBuilderDelegate((BuildContext context, int index) {
//               return Stack(
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () => Navigator.of(context)
//                         .pushNamed(ProductDetails.id, arguments: proddetailid),
//                     child: Row(
//                       children: <Widget>[
//                         FittedBox(
//                           fit: BoxFit.scaleDown,
//                           child: Container(
//                             height: 200,
//                             width: 200,
//                             margin: EdgeInsets.all(8),
//                             alignment: Alignment.centerLeft,
//                             child: Image.network(
//                               firestoreProducts[index].imageUrl,
//                               filterQuality: FilterQuality.none,
//                               scale: 1,
//                               fit: BoxFit.scaleDown,
//                               repeat: ImageRepeat.noRepeat,
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Container(
//                                 alignment: Alignment.topLeft,
//                                 margin: EdgeInsets.only(top: 20),
//                                 child: Text(
//                                   firestoreProducts[index].name,
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w900,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.only(bottom: 5),
//                                 alignment: Alignment.bottomLeft,
//                                 child: Text(
//                                   "Today at 8PM",
//                                   style: TextStyle(
//                                       color: Colors.black54, fontSize: 10),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.only(bottom: 40),
//                                 alignment: Alignment.bottomLeft,
//                                 child: Text(
//                                   firestoreProducts[index].quantity,
//                                   //data["quantity"],
//                                   style: TextStyle(color: Colors.green),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 120, left: 150),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: FlatButton.icon(
//                             color: white,
//                             splashColor: white,
//                             shape: Border(
//                               top: BorderSide(width: 0.1, color: grey),
//                               right: BorderSide(width: 1, color: grey),
//                               left: BorderSide(width: 0, color: grey),
//                               bottom: BorderSide(
//                                 width: 3,
//                                 color: Colors.deepPurple[300],
//                               ),
//                             ),
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.call,
//                               color: Colors.black45,
//                             ),
//                             label: Text(
//                               "Call",
//                               style: TextStyle(
//                                 color: Colors.black45,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: FlatButton.icon(
//                             color: white,
//                             shape: Border(
//                                 top: BorderSide(width: 0.1, color: grey),
//                                 right: BorderSide(width: 1, color: grey),
//                                 left: BorderSide(width: 0, color: grey),
//                                 bottom: BorderSide(
//                                     width: 3, color: Colors.green[300])),
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.message,
//                               color: Colors.black45,
//                             ),
//                             label: Text(
//                               "Chat",
//                               style: TextStyle(
//                                 color: Colors.black45,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               );
//             }, childCount: firestoreProducts.length),
//           )),
//     );
//   }
// }
