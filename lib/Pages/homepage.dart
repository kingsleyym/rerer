import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:hayan_app/widget/dropdown_location.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';
import 'package:hayan_app/widget/search_bar.dart';
import 'package:hayan_app/widget/site_card.dart';
import '../widget/nav_bar.dart';
import 'package:flutter/services.dart' as rootBundle;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<SiteInfos>> ReadJsonData() async {
  final jsondata = await rootBundle.rootBundle.loadString('assets/sites.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => SiteInfos.fromJson(e)).toList();
}

class _HomePageState extends State<HomePage> {
  String? _currentLocation = "DUBAI Sud";
  final _pageController = PageController(viewportFraction: 1);

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
                child: PageView.builder(
                  itemCount: 3,
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: ((context, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: SiteCard(
                          siteName: "Two Becds Apartment",
                          address: "dubai 123",
                          image: AssetImage("assets/images/ZweiBet-30.jpg"),
                        ),
                      ),
                    );
                  }),
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
