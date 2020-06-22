import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xd/Models/ProductsModel.dart';

class FireStoreService {
  Firestore db = Firestore.instance;

  Future<FireStoreProductsasMap> getFirestoreProducts() async {
    try {
      var snap = await db.collection("Products").document().get();
      return FireStoreProductsasMap.fromMap(snap.data);
    } catch (error) {
      //print(error);
    }
    return getFirestoreProducts();
  }

  Stream<FireStoreProductsasMap> streamFirebaseProductsasMap(String id) {
    try {
      return db.collection("Products").document(id).snapshots().map(
            (snap) => FireStoreProductsasMap.fromMap(snap.data),
          );
    } catch (e) {
      //print(e);
    }
    return streamFirebaseProductsasMap(id);
  }

  Stream<List<FireStoreProducts>> streamProducts() {
    try {
      var ref = db.collection("Products");

      return ref
          .snapshots()
          .map((list) => list.documents
              .map((doc) => FireStoreProducts.fromFirestore(doc))
              .toList())
          .handleError((e) {
        //print(e);
        // if (streamProducts == null) {
        //   print("error");
        // }
      });
    } catch (er) {
      //print(er);
    }
    return streamProducts();
  }
}
