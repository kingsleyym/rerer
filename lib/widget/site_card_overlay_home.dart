import 'package:flutter/material.dart';
import 'package:hayan_app/widget/site_card.dart';
import 'package:hayan_app/widget/vr_button.dart';
import '../Pages/panoramasite.dart';
import '../themes/app_theme.dart';
import 'favorite_button.dart';
import 'open_map_button.dart';

class OverlayHome extends StatelessWidget {
  const OverlayHome({
    Key? key,
    required this.widget,
    required this.context,
  }) : super(key: key);

  final SiteCard widget;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            VrButton(
              icon: Icon(
                size: 18,
                Icons.view_in_ar_rounded,
                color: AppTheme.palette.accentColor,
              ),
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
                widget.siteInfos.name ?? "",
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
          widget.siteInfos.address ?? "",
          style: AppTheme.theme.textTheme.caption,
        ),
      ],
    );
  }
}
