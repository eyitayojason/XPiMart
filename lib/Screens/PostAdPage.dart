import 'package:flutter/material.dart';
import 'package:xd/Widgets/BottomNavBar.dart';

import '../konstants.dart';

class PostAdPage extends StatefulWidget {
  @override
  _PostAdPageState createState() => _PostAdPageState();
}

class _PostAdPageState extends State<PostAdPage> {
  List<String> currencies = [
    "Vehicles & Equipment",
    "Food",
    "Elcetronices",
    "Real Estate",
    "Services",
    "Home & Garden",
    "Fashion",
    "Miscelleneous"
  ];

  //bool currentSelectedValue;
  //String value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3.0,
          actions: <Widget>[
            MaterialButton(
              onPressed: () {},
              child: Text("Clear"),
            )
          ],
          iconTheme: IconThemeData().copyWith(
            color: Colors.green,
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
                    onPressed: () {},
                    label: Text("New Advert"),
                    icon: Icon(
                      Icons.more,
                      color: Colors.green,
                    ),
                  ),
                  kSizedboxh10,
                  FormField(
                    builder: (FormFieldState<String> state) {
                      return DropdownButtonFormField(
                        items: currencies.map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // do other stuff with _category
                          setState(() => currencies = newValue);
                        },
                        value: currencies[index],
                        decoration: InputDecoration(
                          labelText: "Category",
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 25),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select expense',
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 25),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ), //   isEmpty: currentSelectedValue == true,
                          //   isFocused: currentSelectedValue == true,
                        ),
                      );
                    },
                  ),
                  kSizedboxh20,
                  TextForm(),
                  kSizedboxh20,
                  FormField(
                    builder: (FormFieldState<String> state) {
                      return DropdownButtonFormField(
                        items: currencies.map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // do other stuff with _category
                          setState(() => currencies = newValue);
                        },
                        value: currencies[index],
                        decoration: InputDecoration(
                          labelText: "Region",
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 25),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select expense',
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 25),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ), //   isEmpty: currentSelectedValue == true,
                          //   isFocused: currentSelectedValue == true,
                        ),
                      );
                    },
                  ),
                  kSizedboxh20,
                  FormField(
                    builder: (FormFieldState<String> state) {
                      return DropdownButtonFormField(
                        items: currencies.map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // do other stuff with _category
                          setState(() => currencies = newValue);
                        },
                        value: currencies[index],
                        decoration: InputDecoration(
                          labelText: "Type",
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 25),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select expense',
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 25),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ), //   isEmpty: currentSelectedValue == true,
                          //   isFocused: currentSelectedValue == true,
                        ),
                      );
                    },
                  ),
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
                        hoverColor: Colors.green,
                        value: false,
                        activeColor: Colors.green,
                        checkColor: Colors.green,
                        focusColor: Colors.green,
                        onChanged: (value) {},
                      ),
                      Text(
                        "Negotiable",
                        style: TextStyle(color: Colors.green, fontSize: 15),
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
                        style: TextStyle(fontSize: 13, color: Colors.grey),
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
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      kSizedboxh20,
                      Text(
                        "Supported formats are .jpg, .gif and .png, Each picture must not exceed 5 Mb",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
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
                      color: Colors.green,
                      child: Text(
                        "Post Ad",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            elevation: 2,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Quantity",

        labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
        //  hintText: 'Please select expense',
        hintStyle: TextStyle(color: Colors.green, fontSize: 25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ), //   isEmpty: currentSelectedValue == true,
        //   isFocused: currentSelectedValue == true,
      ),
    );
  }
}
