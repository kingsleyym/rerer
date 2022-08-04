import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:hayan_app/Pages/me.dart';
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 20),
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
        AppBAr(),
        _header(),
        SizedBox(
          height: 15,
        ),
        SearchBar(
          onPressed: () {},
        ),
        SizedBox(
          height: 5,
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
        SizedBox(
          height: 15,
        ),
        BottomElemnt()
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
      padding: const EdgeInsets.only(top: 15.0, left: 10),
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
        ],
      ),
    );
  }
}

class BottomElemnt extends StatelessWidget {
  const BottomElemnt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 30),
      child: Container(
        height: 65,
        padding: EdgeInsets.fromLTRB(45, 8, 25, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(196, 3, 17, 4),
            border: Border.all(width: 1, color: Colors.white)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Look up for more",
                      style: AppTheme.theme.textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "Wenn du hier drückst,\npassiert was tolles",
                      maxLines: 2,
                      style: AppTheme.theme.textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          height: 0.9,
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                    border: Border.all(width: 2, color: Colors.white)),
                height: 45,
                width: 45,
                child: Center(
                    child: IconButton(
                  icon: Icon(
                    color: Colors.white,
                    Icons.arrow_forward,
                  ),
                  onPressed: () {},
                )),
              )
            ]),
      ),
    );
  }
}
