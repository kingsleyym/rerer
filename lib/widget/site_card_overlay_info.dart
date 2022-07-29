import 'package:flutter/material.dart';
import 'package:hayan_app/widget/vr_button.dart';
import '../Pages/panoramasite.dart';
import '../Pages/site_infos.dart';
import '../themes/app_theme.dart';
import 'open_map_button.dart';

class SideCardOverlayIn extends StatefulWidget {
  const SideCardOverlayIn({
    Key? key,
    required this.context,
    required this.widget,
  }) : super(key: key);

  final BuildContext context;
  final SiteInfosPage widget;

  @override
  State<SideCardOverlayIn> createState() => _SideCardOverlayInState();
}

class _SideCardOverlayInState extends State<SideCardOverlayIn> {
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
                widget.widget.siteinfos.name ?? "",
                style: AppTheme.theme.textTheme.headline5,
                maxLines: 2,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 1.0),
              child: Container(
                height: 120,
                width: 80,
                clipBehavior: Clip.none,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.widget.siteinfos.photos?.length,
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
                                      widget.widget.siteinfos.photos![index])),
                                  fit: BoxFit.cover,
                                ))),
                      );
                    }),
              ),
            ),
          ],
        ),
        Text(
          widget.widget.siteinfos.address ?? "",
          style: AppTheme.theme.textTheme.caption,
        ),
      ],
    );
  }
}
