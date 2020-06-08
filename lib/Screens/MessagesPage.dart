import 'package:flutter/material.dart';
import 'package:xd/Widgets/Models/ListItems.dart';
import 'package:xd/Widgets/NavBarsAppBars/BottomNavBar.dart';
import 'package:xd/Widgets/ProfilePageWidgets.dart';
import 'package:xd/konstants.dart';

class MessagesPage extends StatefulWidget {
  static String id = "MessagesPage";
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool focus1 = false;
  bool focus2 = false;
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(),
          actions: <Widget>[
            Expanded(
              child: MessagePageAppBarButton(
                buttonText: "Messages",
                textColor: focus1 ? Colors.green[300] : Colors.black45,
                onPressed: () {
                  setState(() {
                    focus1 = true;
                    focus2 = false;
                  });
                },
              ),
            ),
            Expanded(
              child: MessagePageAppBarButton(
                buttonText: "Notifications",
                textColor: focus2 ? Colors.green[300] : Colors.black45,
                onPressed: () {
                  setState(() {
                    focus2 = true;
                    focus1 = false;
                  });
                },
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: DropdownButton(
                      style: kButtomNavBarText,
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                    ),
                  ),
                  Text(
                    "Last update 11:52",
                    style: TextStyle(color: Colors.black26, fontSize: 10),
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                ErrorImage(),
                SizedBox(
                  height: 20,
                ),
                Text("No messages yet")
              ],
            )
          ],
        ),
      ),
    );
  }
}
