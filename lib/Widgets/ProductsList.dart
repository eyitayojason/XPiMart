// import 'package:flutter/material.dart';
// import 'CustomProductCard.dart';
// import 'package:provider/provider.dart';
// import 'services/products_provider.dart';

// class ProductsList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productsData = Provider.of<Products>(
//       context,
//     );
//     final products = productsData.items;
//     return FutureBuilder(
//       future: productsData.getFirestore(),
//       builder: (context, snapshot) => SliverFixedExtentList(
//         itemExtent: 150,
//         delegate: SliverChildBuilderDelegate(
//           (BuildContext context, int index) {
//             return Provider.value(
//               // this is the list view widget where i am using the dummy data, this is where i want to display the
//               //data i send to firebase
//               value: snapshot.data,
//               child: CustomProductCard(),
//             );
//           },
//           childCount: products.length,
//         ),
//       ),
//     );
//   }
// }
