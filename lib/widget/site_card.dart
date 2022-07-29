import 'package:flutter/material.dart';
import 'package:hayan_app/widget/site_card_overlay_home.dart';
import '../Pages/site_infos.dart';

class SiteCard extends StatefulWidget {
  const SiteCard({
    Key? key,
    required this.context,
    required this.siteInfos,
  }) : super(key: key);

  final BuildContext context;
  final dynamic siteInfos;

  @override
  State<SiteCard> createState() => _SiteCardState();
}

class _SiteCardState extends State<SiteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(PageRouteBuilder(pageBuilder: (context, animation, _) {
          return SiteInfosPage(siteinfos: widget.siteInfos);
        }));
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8.0, right: 8),
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: const Alignment(0.1, 0),
                  image: AssetImage(widget.siteInfos.pic ?? ""),
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
                child: OverlayHome(widget: widget, context: context),
              ))),
    );
  }
}
