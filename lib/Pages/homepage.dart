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
  String? _currentLocation = "DUBAI Sud";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),
              Spacer(
                flex: 1,
              ),
              SearchBar(
                onPressed: () {},
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 20,
                child: SiteCard(
                  siteName: "Two Beds Apartment",
                  address: "dubai 123",
                  image: AssetImage("assets/images/ZweiBet-30.jpg"),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              NavBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Column(children: [
          DropDownLocation(
            location: _currentLocation,
            elements: [
              "DUBAI Nord",
              "DUBAI East",
              "DUBAI Sud",
            ],
            onLocationChanged: (Location) {
              setState(() {
                _currentLocation = Location;
              });
            },
          ),
        ]),
        Spacer(),
        NotifyIconButton(),
      ],
    );
  }
}
