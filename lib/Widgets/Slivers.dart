import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xd/konstants.dart';

class CustomSliverAppBAr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      centerTitle: true,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Text(
            "What are you looking for?",
            textAlign: TextAlign.center,
            style: khomeappbartitle,
          ),
        ),
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: SliverAppBarTextField(
          icondata: Icons.search,
        ),
      ),
      expandedHeight: 200,
    );
  }
}

class SliverAppBarTextField extends StatelessWidget {
  const SliverAppBarTextField({
    this.iconData,
    this.container,
    this.icondata,
    this.iconData2,
  });

  final Widget container;
  final IconData icondata;
  final IconData iconData;
  final IconData iconData2;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.only(
          bottom: 10,
          left: 5,
          right: 5,
        ),
        height: 40,
        child: TextField(
          cursorWidth: 1.5,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 9),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SliverAppbarTextfieldicons(
              iconData: icondata,
            ),
            SliverAppbarTextfieldicons(
              iconData: Icons.tune,
            ),
          ],
        ),
      ),
    ]);
  }
}

class SliverAppbarTextfieldicons extends StatelessWidget {
  SliverAppbarTextfieldicons({
    this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.green[300],
        ),
      ],
    );
  }
}

class SliverCard extends StatelessWidget {
  SliverCard({this.subtitle, this.child});

  final Widget child;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.4,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: child);
  }
}

class SliverContainer extends StatelessWidget {
  const SliverContainer({this.child, this.text});

  final Widget child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(11),
      sliver: SliverToBoxAdapter(
        child: child,
      ),
    );
  }
}
