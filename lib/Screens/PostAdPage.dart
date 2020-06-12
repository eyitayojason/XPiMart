import 'package:flutter/material.dart';
import 'package:xd/Widgets/FormFieldWidgets/TextForm.dart';
import 'package:xd/Widgets/FormfieldWidget.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import '../konstants.dart';

FormFieldWidget formFieldWidget = FormFieldWidget();

class PostAdPage extends StatelessWidget {
  static const id = "PostAdPage";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    padding: EdgeInsets.only(left: 30),
                    label: Text("New Advert"),
                    icon: Icon(
                      Icons.more,
                      color: green,
                    ),
                  ),
                  kSizedboxh10,
                  formFieldWidget.buildItem(context, index),
                  kSizedboxh20,
                  TextForm(),
                  kSizedboxh20,
                  formFieldWidget.buildItem(context, index),
                  kSizedboxh20,
                  formFieldWidget.buildItem(context, index),
                  kSizedboxh20,
                  TextForm(),
                  kSizedboxh20,
                  TextForm(),
                  kSizedboxh20,
                  TextForm(),
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
                      Text(
                        "First picture is the title picture. Drag the Photos to change the order",
                        style: TextStyle(fontSize: 13, color: grey),
                      ),
                      kSizedboxh15,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {},
                            elevation: 0,
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                          Text(
                            "Add Photos",
                            style: TextStyle(color: green),
                          ),
                        ],
                      ),
                      kSizedboxh20,
                      Text(
                        "Supported formats are .jpg, .gif and .png, Each picture must not exceed 5 Mb",
                        style: TextStyle(fontSize: 13, color: grey),
                      ),
                      kSizedboxh20,
                      TextForm(),
                      kSizedboxh20,
                      TextForm(),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: MaterialButton(
                      height: 40,
                      onPressed: () {},
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
    );
  }
}
