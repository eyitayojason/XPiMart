import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProducts {
  final String id;
  final String price;
  final String title;
  final String description;
  final String quantity;
  final String imageUrl;
  final String name;
  //final DateTime timestamp;
  FireStoreProducts({
    this.description,
    this.id,
    this.imageUrl,
    this.price,
    this.quantity,
    this.title,
    this.name,
    //this.timestamp
  });

  factory FireStoreProducts.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return FireStoreProducts(
      id: doc.documentID,
      title: data["title"],
      price: data["price"],
      quantity: data["quantity"],
      description: data["description"],
      imageUrl: data["imageUrl"],
      name: data["name"],
      //timestamp: data["timestamp"]
    );
  }
}

class FireStoreProductsasMap {
  final String id;
  final String price;
  final String title;
  final String description;
  final String quantity;
  final String imageUrl;
  final String name;
  FireStoreProductsasMap(
      {this.description,
      this.id,
      this.imageUrl,
      this.price,
      this.quantity,
      this.title,
      this.name});

  factory FireStoreProductsasMap.fromMap(Map data) {
    return FireStoreProductsasMap(
        //    id: doc.documentID,
        title: data["title"],
        price: data["price"],
        quantity: data["quantity"],
        description: data["description"],
        imageUrl: data["imageUrl"],
        name: data["name"]);
  }
}
