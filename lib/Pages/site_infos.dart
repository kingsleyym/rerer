import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/site_card.dart';
import 'package:hayan_app/Models/site_infos.dart';

import '../widget/site_card_overlay_info.dart';

class SiteInfosPage extends StatefulWidget {
  const SiteInfosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SiteInfosPage> createState() => _SiteInfosPageState();
}

class _SiteInfosPageState extends State<SiteInfosPage> {
  late SiteInfos _siteInfos;
  late SiteCardOverlayInfos _cardOverlay;

  @override
  void initState() {
    super.initState();

    _cardOverlay = SiteCardOverlayInfos();
  }

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
          SiteCard(
            overlay: _cardOverlay,
            siteInfos: currentSite,
          ),
          Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                Text(
                  _siteInfos.ateliers.toString(),
                )
              ]))
        ],
      ),
    );
  }
}
