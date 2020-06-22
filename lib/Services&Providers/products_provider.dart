import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:xd/Models/ProductsModel.dart';
import 'package:xd/Pages&Screens/PostAdPage.dart';

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
