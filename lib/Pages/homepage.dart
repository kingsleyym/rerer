import 'package:flutter/material.dart';
import 'package:hayan_app/widget/dropdown_location.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';
import 'package:hayan_app/widget/search_bar.dart';
import 'package:hayan_app/widget/site_card.dart';

import '../widget/nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 48, 16, 0),
        child: Container(
          height: MediaQuery.of(context).size.height - 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),
              Spacer(),
              SearchBar(
                onPressed: () {},
              ),
              Spacer(),
              SiteCard(
                siteName: "Two Beds Apartment",
                address: "dubai 123",
                image: AssetImage("assets/images/ZweiBet-02.jpg"),
              ),
              Spacer(),
              NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _header() {
  return Row(
    children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropDownLocation(
              location: "Dubai East",
              onLocationChanged: (Location) {},
            ),
          ]),
      Spacer(),
      NotifyIconButton(),
    ],
  );
}
