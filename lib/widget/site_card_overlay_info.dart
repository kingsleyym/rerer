import 'package:flutter/material.dart';
import 'package:hayan_app/widget/vr_button.dart';
import '../Pages/homepage.dart';
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
              icon: Icon(
                size: 18,
                Icons.arrow_back,
                color: AppTheme.palette.accentColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            const Spacer(),
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
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 150,
                child: Text(
                  widget.widget.siteinfos.name ?? "",
                  style: AppTheme.theme.textTheme.headline5,
                  maxLines: 2,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 1.0),
              child: Container(
                height: 100,
                width: 80,
                clipBehavior: Clip.none,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.widget.siteinfos.photos?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
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
