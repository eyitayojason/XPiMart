import 'package:flutter/material.dart';
import 'package:xd/Screens/categorylist_page.dart';
import 'package:xd/Widgets/CustomSliverList.dart';
import 'package:xd/Widgets/Models/ListItems.dart';
import 'package:xd/Widgets/Models/ProductsModel.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import '../konstants.dart';

class CategoryListPage2 extends StatefulWidget {
  // CategoryListPage2({this.thumbsNailModel});
  static const id = "CategoryListPage2";

  //final ThumbsNailModel thumbsNailModel;

  @override
  _CategoryListPage2State createState() => _CategoryListPage2State();
}

class _CategoryListPage2State extends State<CategoryListPage2> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  final String proddetailid;
  final List<FireStoreProducts> firestoreProducts;

  _CategoryListPage2State({this.proddetailid, this.firestoreProducts});

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedAppBar(
            iconButton: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star_border,
                color: Colors.green,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                buildDropDownButton(),
                buildDropDownButton(),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Found 23308 ads in NIGERIA"),
                  Row(
                    children: <Widget>[
                      Text("Show"),
                      FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sort,
                          color: Colors.green,
                        ),
                        label: Text("Relevant"),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 1,
                            child: Icon(Icons.vertical_align_bottom),
                            color: Colors.green,
                          ),
                          FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.access_time,
                              color: Colors.green,
                            ),
                            label: Text("Anytime"),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // ProductsList(
          //     proddetailid: proddetailid, firestoreProducts: firestoreProducts),

          // SliverListWidget()
        ],
      ),
    );
  }

  FlatButton buildDropDownButton() {
    return FlatButton(
      onPressed: () {},
      child: DropdownButton(
        style: kButtomNavBarText,
        value: _selectedCompany,
        items: _dropdownMenuItems,
        onChanged: onChangeDropdownItem,
      ),
    );
  }
}
