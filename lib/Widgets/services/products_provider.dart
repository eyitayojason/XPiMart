import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xd/Screens/PostAdPage.dart';
import 'package:flutter/material.dart';
import 'package:xd/Widgets/Models/ProductsModel.dart';

//final dbRef = FirebaseDatabase.instance.reference().child("Products");
var base64;
var convertedbase64;

// This is the dummy data list i have been using
class Products with ChangeNotifier {
  static List<FireStoreProducts> _items = [];
  static List<FireStoreProducts> get items {
    //notifyListeners();
    return [..._items];
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    file = File(pickedFile.path);
  }

  File file;
  String id;
  final List<FireStoreProducts> loadedProducts = [];
  final picker = ImagePicker();
  QuerySnapshot qn;
  StorageUploadTask task;

  Future<void> postFirestore(FireStoreProducts thumbsNailModel) async {
    String pictureUrl = await (await task.onComplete).ref.getDownloadURL();
    DocumentReference firestoreDb =
        await Firestore.instance.collection("Products").add({
      /// "sender": loggedinuser.email,
      "title": PostAdPageState.titleTextController.text,
      "description": PostAdPageState.descriptionTextController.text,
      "quantity": PostAdPageState.quantityTextController.text,
      "name": PostAdPageState.nameTextController.text,
      "price": PostAdPageState.phoneTextController.text,
      //"Category": category[index].toString(),
      "imageUrl": pictureUrl,
      //  "imageName"  fileName ,  //provider.items[index].productThumbnails,
      "timestamp": DateTime.now().toString(),
    });
    id = firestoreDb.documentID;
  }

  void onErrorCallback(error, stackTrace) {
    print(error);
    print(stackTrace);
  }

  void profilePictureCallback(
      {List<UploadJob> uploadJobs, bool pictureUploadProcessing}) {
    profilePictures = uploadJobs;
  }

  Future<StorageReference> uploadProfilePicture(File image, int id) async {
    StorageReference imgRef = FirebaseStorage.instance.ref().child('/Uploads/' +
        'Directory' +
        '/' +
        'custom1' +
        '_' +
        id.toString() +
        '_800.jpg');

    // start upload
    StorageUploadTask uploadTask = imgRef.putFile(
        image,
        new StorageMetadata(
          contentType: 'image/jpg, image/png',
        ));
    task = uploadTask;

    // wait until upload is complete

    return imgRef;
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}

Future<void> deleteProfilePicture(StorageReference oldUpload) async {
  // ask backend to transform images
  await oldUpload.delete();
}

List<UploadJob> profilePictures = [];
// Future<void> postProduct(ThumbsNailModel product) {
//   const url = 'https://flutter-update.Firebaseio.com/Products.json';
//   return http
//       .post(
//     url,
//     body: json.encode({
//       "title": PostAdPageState.titleTextController.text,
//       "description": PostAdPageState.descriptionTextController.text,
//       "quantity": PostAdPageState.quantityTextController.text,
//       "name": PostAdPageState.nameTextController.text,
//       "phone": PostAdPageState.phoneTextController.text,
//       //"Category": category[index].toString(),
//       "imageUrl": base64,
//       //  "imageName"  fileName ,  //provider.items[index].productThumbnails,
//       "timestamp": DateTime.now().toString(),
//     }),
//   )
//       .then((response) {
//     final loadedProducts = ThumbsNailModel(
//       subtitle: product.subtitle,
//       productDescription: product.productDescription,
//       price: product.price,
//       productThumbnails: product.productThumbnails,
//       id: json.decode(response.body)['name'],
//     );
//     print(response.body);
//     _items.add(loadedProducts);

//     notifyListeners();
//   });
//   // if (file == null)
//   // String base64Image = base64UrlEncode(file.readAsBytesSync());
//   // base64 = base64Image;
// }

// Future firebasePost(ThumbsNailModel product) async {
//   try {
//     notifyListeners();
//     if (file == null) return;
//     String base64Image = base64UrlEncode(file.readAsBytesSync());

//     base64 = base64Image;
//     //String fileName = file.path.split("/").last.toString();
//     await dbRef.push().set({
//       /// "sender": loggedinuser.email,
//       "title": PostAdPageState.titleTextController.text,
//       "description": PostAdPageState.descriptionTextController.text,
//       "quantity": PostAdPageState.quantityTextController.text,
//       "name": PostAdPageState.nameTextController.text,
//       "phone": PostAdPageState.phoneTextController.text,
//       //"Category": category[index].toString(),
//       "imageUrl": base64,
//       //  "imageName"  fileName ,  //provider.items[index].productThumbnails,
//       "timestamp": DateTime.now().toString(),
//     });
//   } catch (error) {
//     print(error);
//   }
// }

// getFirestore() async {
//   try {
//     var firestore = Firestore.instance;

//     QuerySnapshot snapshot =
//         await firestore.collection("Products").getDocuments();
//     qn = snapshot;

//     print(qn.documents);

//     return qn.documents;
//   } catch (e) {
//     print(e);
//   }

//   //     .then(() {
//   //   snapshot.documents.forEach((f) => print('${f.data}}')
//   //   );
//   // });
// }
// List<ThumbsNailModel> _items = [
//   ThumbsNailModel(
//     id: "p1",
//     productThumbnails: "https://picsum.photos/300?random=1.jpg",
//     subtitle: "Range Rover Sport S 2017",
//     productDescription:
//         "Luxurious and Highly Elegant Range Rover Sports 2017 Edition",
//     price: "N5,000,000",
//   ),
//   ThumbsNailModel(
//       id: "p2",
//       productThumbnails: "https://picsum.photos/300?random=1.jpg",
//       subtitle: "Citroen Cabrio 4WD",
//       productDescription: "Beautiful 2 Door Citroen Cabrio Coupe with 4WD",
//       price: "N1,200,000"),
//   ThumbsNailModel(
//     id: "p3",
//     productThumbnails: "https://picsum.photos/300?random=1.jpg",
//     subtitle: "2012 Honda Accord SE",
//     productDescription:
//         "Neat 2012 Honda Accord Sedan for Family trips and great road jorneys",
//     price: "N1,000,000",
//   ),
//   ThumbsNailModel(
//     id: "p4",
//     productThumbnails: "https://picsum.photos/300?random=1.jpg",
//     subtitle: "Toyota Prius 2020 AWD",
//     productDescription:
//         "Latest New model Toyota Prius, an hybrid monster ride to rule the roads",
//     price: "N2,770,000",
//   ),
//   ThumbsNailModel(
//     id: "p5",
//     productThumbnails: "https://picsum.photos/300?random=1.jpg",
//     subtitle: "Mercedes CLK GT 2016",
//     productDescription:
//         "Strong Bullet proof Mercedes Benz CLK, Can withstand maximum impact hit",
//     price: "N15,000,000",
//   ),
//   ThumbsNailModel(
//     id: "p6",
//     productThumbnails: "https://picsum.photos/300?random=1.jpg",
//     subtitle: "Mercedes Benz GLK 2021",
//     productDescription:
//         "Probably the best car of 2020, TEsted with 98.2 percent fuel efficeincy and also hybrid electric vehicle",
//     price: "N45,000,000",
//   )
// ];

// List<FireStoreProducts> get items {
//   return [..._items];
// }

// FireStoreProducts findById(String id) {
//   return _items.firstWhere((prod) => prod.subtitle == id);
// }

// Future fetchAndSetProducts() async {
//   Uint8List bytes = base64Decode(base64);
//   convertedbase64 = bytes;
//   const url = 'https://xpi-mart.firebaseio.com/Items.json';
//   try {
//     final response = await http.get(url);
//     final extractedData = json.decode(response.body) as Map<String, dynamic>;
//     // print(json.decode(response.body));
//     extractedData.forEach((prodId, prodData) {
//       loadedProducts.add(
//         ThumbsNailModel(
//           id: prodId,
//           subtitle: prodData['name'],
//           productDescription: prodData['description'],
//           price: prodData['title'],
//           productThumbnails: prodData['imageUrl'],
//           productThumbnailsBytes: prodData[bytes.toString()],
//         ),
//       );
//     });
//     _items = loadedProducts;
//     print(json.decode(response.body));
//   } catch (error) {
//     print(error);
//   }
// }
