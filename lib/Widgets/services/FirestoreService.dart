import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xd/Widgets/Models/ProductsModel.dart';

class FireStoreService {
  Firestore db = Firestore.instance;

  Future<FireStoreProductsasMap> getFirestoreProducts(String id) async {
    var snap = await db.collection("Products").document(id).get();

    return FireStoreProductsasMap.fromMap(snap.data);
  }

  Stream<FireStoreProductsasMap> streamFirebaseProductsasMap(String id) {
    return db.collection("Products").document(id).snapshots().map(
          (snap) => FireStoreProductsasMap.fromMap(snap.data),
        );
  }

  Stream<List<FireStoreProducts>> streamProducts() {
    var ref = db.collection("Products");

    return ref.snapshots().map((list) => list.documents
        .map((doc) => FireStoreProducts.fromFirestore(doc))
        .toList());
  }
}
