import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:imageview360/imageview360.dart';
import '../widget/site_card_overlay_info.dart';

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
  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = true;
  int rotationCount = 1;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.clockwise;
  Duration frameChangeDuration = Duration(milliseconds: 60);
  bool imagePrecached = true;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        child: _pageBuilder(),
      ),
    );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 90; i++) {
      imageList.add(AssetImage('assets/images/369/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/images/369/$i.png'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }

  Widget _pageBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: const Alignment(0.1, 0),
                image: AssetImage(widget.siteinfos.photos?.elementAt(2) ?? ""),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
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
              child: SideCardOverlayIn(
                context: context,
                widget: widget,
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Description",
                  style: AppTheme.theme.textTheme.subtitle2,
                ),
              ),
              Row(
                children: [
                  _roomInfo(
                      text: "${widget.siteinfos.ateliers} ateliers",
                      icon: Icons.meeting_room_outlined),
                  _roomInfo(
                      text: "${widget.siteinfos.ateliers} ateliers",
                      icon: Icons.house_outlined),
                ],
              ),
              _roomInfo(
                  text: "${widget.siteinfos.coworking} escapes de coworkiig",
                  icon: Icons.house_outlined),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  widget.siteinfos.desc ?? "",
                  style: AppTheme.theme.textTheme.bodyText2,
                ),
              ),
              Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  top: 80,
                  height: 80,
                  width: 250,
                  left: 100,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 15,
                            offset: Offset(0, 12),
                            color: Colors.black26,
                          )
                        ],
                        color: AppTheme.palette.accentColor,
                        borderRadius: BorderRadius.circular(45)),
                  ),
                ),
                _imaGere(),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _roomInfo({required String text, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppTheme.palette.buttonNavigation,
              ),
              child: Icon(
                icon,
                color: AppTheme.palette.accentColor,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: AppTheme.theme.textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imaGere() {
    return (imagePrecached == true)
        ? ImageView360(
            key: UniqueKey(),
            imageList: imageList,
            autoRotate: true,
            rotationCount: rotationCount,
            rotationDirection: RotationDirection.anticlockwise,
            frameChangeDuration: frameChangeDuration,
            swipeSensitivity: swipeSensitivity,
            allowSwipeToRotate: allowSwipeToRotate,
          )
        : Text(
            "Pre-Caching images...",
            style: AppTheme.theme.textTheme.headline2,
          );
  }
}
