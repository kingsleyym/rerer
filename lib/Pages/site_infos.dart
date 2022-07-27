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
                child: SideCardOverlay(
                  context: context,
                  widget: widget,
                ),
              )),
          Text(
            widget.siteinfos.ateliers.toString(),
          )
        ],
      ),
    );
  }
}

class SideCardOverlay extends StatelessWidget {
  const SideCardOverlay({
    Key? key,
    required this.context,
    required this.widget,
  }) : super(key: key);

  final BuildContext context;
  final SiteInfosPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            VrButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
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
            Spacer(),
            Positioned(
              top: -200,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 1.0),
                child: Container(
                  height: 120,
                  width: 80,
                  clipBehavior: Clip.none,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.siteinfos.photos?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: (AssetImage(
                                        widget.siteinfos.photos![index])),
                                    fit: BoxFit.cover,
                                  ))),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
        Text(
          widget.siteinfos.address ?? "",
          style: AppTheme.theme.textTheme.caption,
        ),
      ],
    );
  }
}
