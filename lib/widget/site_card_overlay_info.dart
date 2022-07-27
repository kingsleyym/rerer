import 'package:flutter/material.dart';
import 'package:hayan_app/widget/vr_button.dart';
import '../Pages/panoramasite.dart';
import '../themes/app_theme.dart';
import 'favorite_button.dart';
import 'open_map_button.dart';

class SiteCardOverlayInfos extends StatelessWidget {
  const SiteCardOverlayInfos({
    Key? key,
  }) : super(key: key);

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
            SizedBox(
              width: 150,
              child: Text(
                "Two Becds Apartment",
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
          "dubai 123",
          style: AppTheme.theme.textTheme.caption,
        ),
      ],
    );
  }
}
