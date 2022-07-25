import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:hayan_app/widget/dropdown_location.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';
import 'package:hayan_app/widget/search_bar.dart';
import 'package:hayan_app/widget/site_card.dart';
import 'package:hayan_app/widget/site_card_overlay_home.dart';
import '../widget/nav_bar.dart';
import 'package:flutter/services.dart' as rootBundle;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<SiteInfos>> ReadJsonData() async {
  final jsondata = await rootBundle.rootBundle.loadString('assets/sites.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => SiteInfos.fromJson(e)).toList();
}

class _HomePageState extends State<HomePage> {
  PageController _currentLocation = PageController(initialPage: 0);
  final _pageController = PageController(viewportFraction: 1);
  late SiteInfos _siteInfos;
  late SiteCardOverlayHome _overlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: FutureBuilder(
            future: annuaireSrv.load(_annuaireFile),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _pageBuilder(snapshot.data as Annuaire);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _pageBuilder(Annuaire annuaire) {
    final sites = annuaire.sites;
    final SiteInfos currentsite = sites[_currentLocation]!;
    final _overlay = SiteCardOverlayHome(siteInfos: currentsite);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _header(),
        const Spacer(
          flex: 1,
        ),
        SearchBar(
          onPressed: () {},
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 20,
          child: PageView.builder(
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: SiteCard(
                  overlay: _overlay,
                  siteInfos: currentsite,
                ),
              );
            }),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        const NavBar(),
      ],
    );
  }

  Widget _header() {
    return Row(
      children: [
        Column(children: [
          DropDownLocation(
            location: _pageController as String,
            elements: const [
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
        const Spacer(),
        const NotifyIconButton(),
      ],
    );
  }
}
