import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/favorite_button.dart';
import 'package:hayan_app/widget/open_map_button.dart';
import 'package:hayan_app/widget/site_card_overlay_home.dart';
import '../Models/site_infos.dart';
import 'vr_button.dart';
import 'package:hayan_app/Pages/panoramasite.dart';

class SiteCard extends StatelessWidget {
  final SiteInfos siteInfos;
  final Widget overlay;

  const SiteCard({
    Key? key,
    required this.siteInfos,
    required this.overlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: const Alignment(0.1, 0),
            image: AssetImage("assets/images/ZweiBet-2"),
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
          child: overlay,
        ));
  }
}
