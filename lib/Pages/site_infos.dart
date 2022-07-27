import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hayan_app/Pages/panoramasite.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/site_card.dart';
import 'package:hayan_app/Models/site_infos.dart';

import '../widget/favorite_button.dart';
import '../widget/open_map_button.dart';
import '../widget/site_card_overlay_info.dart';
import '../widget/vr_button.dart';

class SiteInfosPage extends StatefulWidget {
  const SiteInfosPage({
    Key? key,
    required this.siteinfos,
  }) : super(key: key);

  final SiteInfos siteinfos;

  @override
  State<SiteInfosPage> createState() => _SiteInfosPageState();
}

class _SiteInfosPageState extends State<SiteInfosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 48, 16, 48),
        child: _pageBuilder(),
      ),
    );
  }

  Widget _pageBuilder() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: const Alignment(0.1, 0),
                  image:
                      AssetImage(widget.siteinfos.photos?.elementAt(2) ?? ""),
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
                              widget.siteinfos.name ?? "",
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
                        widget.siteinfos.address ?? "",
                        style: AppTheme.theme.textTheme.caption,
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            height: 150,
            width: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.siteinfos.photos?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Image.asset(widget.siteinfos.photos![index]),
                  );
                }),
          ),
          Text(
            widget.siteinfos.ateliers.toString(),
          )
        ],
      ),
    );
  }
}
