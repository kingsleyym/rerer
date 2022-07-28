import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:hayan_app/Pages/panoramasite.dart';
import 'package:hayan_app/Pages/site_infos.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';
import 'package:hayan_app/widget/search_bar.dart';
import '../themes/app_theme.dart';
import '../widget/favorite_button.dart';
import '../widget/nav_bar.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

import '../widget/open_map_button.dart';
import '../widget/vr_button.dart';

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
            clipBehavior: Clip.none,
            itemCount: siteInfos.length,
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemBuilder: ((context, int index) {
              final siteInfos = SiteInfos[index];
              return siteCard(context, siteInfos);
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

  GestureDetector siteCard(BuildContext context, siteInfos) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(PageRouteBuilder(pageBuilder: (context, animation, _) {
          return SiteInfosPage(siteinfos: siteInfos);
        }));
      },
      child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Container(
              clipBehavior: Clip.none,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: const Alignment(0.1, 0),
                  image: AssetImage(siteInfos.pic ?? ""),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0, 12),
                    color: Colors.black26,
                  )
                ],
              ),
              child: Container(
                height: 400,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.transparent,
                    Colors.black12,
                    Colors.black54,
                  ], stops: [
                    0.5,
                    0.75,
                    1
                  ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          VrButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePage()),
                              );
                            },
                          ),
                          const Spacer(),
                          const OpenMapButton(),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              siteInfos.name ?? "",
                              style: AppTheme.theme.textTheme.headline5,
                              maxLines: 2,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: FavoriteButton(
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 12,
                      ),
                      Text(
                        siteInfos.address ?? "",
                        style: AppTheme.theme.textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ))),
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
      padding: const EdgeInsets.only(top: 20.0),
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
