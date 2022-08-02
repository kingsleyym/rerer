import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';
import 'package:hayan_app/widget/search_bar.dart';
import '../themes/app_theme.dart';
import 'package:hayan_app/widget/site_card.dart';
import '../widget/nav_bar.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(viewportFraction: 1, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data) {
              if (data.hasData) {
                var siteinfo = data.data as List<SiteInfos>;
                return _pageBuilder(data.data);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _pageBuilder(SiteInfos) {
    final siteInfos = SiteInfos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _header(),
        SizedBox(
          height: 15,
        ),
        SearchBar(
          onPressed: () {},
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          flex: 8,
          child: PageView.builder(
            clipBehavior: Clip.none,
            itemCount: siteInfos.length,
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemBuilder: ((context, int index) {
              final siteInfos = SiteInfos[index];
              return SiteCard(context: context, siteInfos: siteInfos);
            }),
          ),
        ),
      ],
    );
  }

  Future<List<SiteInfos>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/sites.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => SiteInfos.fromJson(e)).toList();
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "emplacement",
                      style: AppTheme.theme.textTheme.bodyText2
                          ?.copyWith(fontSize: 12),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: AppTheme.palette.accentColor,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: AppTheme.palette.accentColor,
                    ),
                    Text(
                      "DUBAI West",
                      style: AppTheme.theme.textTheme.headline4,
                    ),
                  ],
                )
              ]),
          const Spacer(),
          const NotifyIconButton(),
        ],
      ),
    );
  }
}
