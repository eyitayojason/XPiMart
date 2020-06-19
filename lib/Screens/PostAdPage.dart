import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:xd/Widgets/FormFieldWidgets/TextForm.dart';
import 'package:xd/Widgets/FormfieldWidget.dart';
import 'package:xd/Widgets/Models/ProductsModel.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/services/products_provider.dart';
import '../konstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginScreen.dart';

class PostAdPage extends StatefulWidget {
  static const id = "PostAdPage";

  @override
  PostAdPageState createState() => PostAdPageState();
}

class PostAdPageState extends State<PostAdPage> {
  static final descriptionTextController = TextEditingController();
  static final nameTextController = TextEditingController();
  static final phoneTextController = TextEditingController();
  static final quantityTextController = TextEditingController();
  static final titleTextController = TextEditingController();

  final category = [
    "Vehicles & Equipment",
    "Food",
    "Elcetronices",
    "Real Estate",
    "Services",
    "Home & Garden",
    "Fashion",
    "Miscelleneous"
  ];

  final dbRef = FirebaseDatabase.instance.reference().child("Products");
  String description;
  String dropdownValue;
  FormFieldWidget formFieldWidget = FormFieldWidget();
  //ImagePicker imagePicker = ImagePicker();
  var loggedinuser;
  String name;
  var phone;
  var quantity;
  var thisInstant = DateTime.now();
  String title;
  FirebaseUser user;

  static final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedinuser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Products>(context);
    return Form(
      key: _formKey,
      child: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: LoginScreen.showSpinner,
          opacity: 0.5,
          color: Colors.black,
          progressIndicator: SpinKitChasingDots(
            color: Colors.blue,
            size: 90,
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: white,
              elevation: 3.0,
              actions: <Widget>[
                MaterialButton(
                  onPressed: () {},
                  child: Text("Clear"),
                )
              ],
              iconTheme: IconThemeData().copyWith(
                color: green,
              ),
              title: Text(
                "Post New Ad",
                style: kappBarText,
              ),
            ),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: () {},
                        padding: EdgeInsets.only(left: 30),
                        label: Text("New Advert"),
                        icon: Icon(
                          Icons.more,
                          color: green,
                        ),
                      ),
                      kSizedboxh10,
                      // formFieldWidget.buildItem(
                      //   formFieldWidget.newValue,
                      //   index,
                      // ),
                      // FormFieldWidget(
                      //   dropDownButtonFormFieldvalue: dropdownValue,
                      //   category: category,
                      //   items: category.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      //   onChanged: (String newValue) {
                      //     setState(() {
                      //       dropdownValue = newValue;
                      //     });
                      //   },
                      // ).build(context, index),
                      // kSizedboxh20,
                      TextForm(
                        labeltext: "Title",
                        onChanged: (String value) {
                          title = value;
                        },
                        controller: titleTextController,
                      ),
                      kSizedboxh20,
                      FormFieldWidget().build(context, index),
                      kSizedboxh20,
                      TextForm(
                        labeltext: "Description",
                        onChanged: (String value) {
                          description = value;
                        },
                        controller: descriptionTextController,
                      ),
                      kSizedboxh20,
                      TextForm(
                        labeltext: "Quantity",
                        onChanged: (var value) {
                          quantity = value;
                        },
                        controller: quantityTextController,
                      ),
                      kSizedboxh20,
                      TextForm(
                        labeltext: "Full-Name",
                        onChanged: (String value) {
                          name = value;
                        },
                        controller: nameTextController,
                      ),
                      kSizedboxh20,
                      TextForm(
                        labeltext: "Phone Number",
                        onChanged: (var value) {
                          phone = value;
                        },
                        controller: phoneTextController,
                      ),
                      kSizedboxh20,
                      Row(
                        children: <Widget>[
                          Checkbox(
                            hoverColor: green,
                            value: false,
                            activeColor: green,
                            checkColor: green,
                            focusColor: green,
                            onChanged: (value) {},
                          ),
                          Text(
                            "Negotiable",
                            style: TextStyle(color: green, fontSize: 15),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Add Photo",
                            style: TextStyle(fontSize: 16),
                          ),
                          kSizedboxh10,
                          Text(
                            "First picture is the title picture. Drag the Photos to change the order",
                            style: TextStyle(fontSize: 13, color: grey),
                          ),
                          kSizedboxh15,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // FloatingActionButton(
                              //   backgroundColor: Colors.green,
                              //   onPressed: () {
                              //     provider.getImage();
                              //   },
                              // ),
                              new PictureUploadWidget(
                                onPicturesChange:
                                    provider.profilePictureCallback,
                                initialImages: profilePictures,
                                settings: PictureUploadSettings(
                                    onErrorFunction: provider.onErrorCallback,
                                    customUploadFunction:
                                        provider.uploadProfilePicture,
                                    uploadDirectory: '/Uploads/'),
                                buttonStyle: const PictureUploadButtonStyle(
                                  backgroundColor: Colors.grey,
                                ),
                                buttonText: 'Upload Picture',
                                enabled: true,
                              )
                            ],
                          ),
                          kSizedboxh20,
                          Text(
                            "Supported formats are .jpg, .gif and .png, Each picture must not exceed 5 Mb",
                            style: TextStyle(fontSize: 13, color: grey),
                          ),
                          // provider.file == null
                          //     ? Text('No Image Selected')
                          //     : Image.file(provider.bytesfile)
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: MaterialButton(
                          height: 40,
                          onPressed: () async {
                            setState(() {
                              authentication.showspinner();
                            });

                            // })
                            FireStoreProducts fireStoreProducts =
                                FireStoreProducts();
                            // await provider.firebasePost(thumbsNailModel);
                            await provider
                                .postFirestore(fireStoreProducts)
                                .then((_) {
                              titleTextController.clear();
                              descriptionTextController.clear();
                              quantityTextController.clear();
                              nameTextController.clear();
                              phoneTextController.clear();
                              Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                message: "AD POSTED SUCCESSFULLY",
                                showProgressIndicator: true,
                                flushbarStyle: FlushbarStyle.FLOATING,
                                blockBackgroundInteraction: true,
                                icon: Icon(
                                  Icons.info_outline,
                                  size: 40.0,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 6),
                                leftBarIndicatorColor: Colors.green,
                              )..show(context);
                            });
                            setState(() {
                              authentication.stopSpinner();
                            });
                          },
                          color: green,
                          child: Text(
                            "Post Ad",
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 2,
                color: white,
              ),
            ),
            bottomNavigationBar: BottomNavBar(),
          ),
        ),
      ),
    );
  }
}
