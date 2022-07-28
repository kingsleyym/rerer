import 'package:flutter/material.dart';
import 'package:hayan_app/Pages/panoramasite.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:imageview360/imageview360.dart';
import '../widget/open_map_button.dart';
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
  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = true;
  int rotationCount = 20;
  int swipeSensitivity = 3;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 24);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 18; i++) {
      imageList.add(AssetImage('assets/images/369/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/images/369/$i.png'), context);
    }
    setState(() {
      imagePrecached = true;
    });
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
              child: SideCardOverlay(
                context: context,
                widget: widget,
              ),
            )),
        Text(
          widget.siteinfos.ateliers.toString(),
        ),
        (imagePrecached == true)
            ? ImageView360(
                key: UniqueKey(),
                imageList: imageList,
                autoRotate: true,
                rotationCount: rotationCount,
                rotationDirection: RotationDirection.anticlockwise,
                frameChangeDuration: frameChangeDuration,
                swipeSensitivity: swipeSensitivity,
                allowSwipeToRotate: allowSwipeToRotate,
                onImageIndexChanged: (currentImageIndex) {
                  print("currentImageIndex: $currentImageIndex");
                },
              )
            : Text("Pre-Caching images..."),
      ],
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
            SizedBox(
              width: 150,
              child: Text(
                widget.siteinfos.name ?? "",
                style: AppTheme.theme.textTheme.headline5,
                maxLines: 2,
              ),
            ),
            const Spacer(),
            Positioned(
              top: -200,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 1.0),
                child: Container(
                  height: 120,
                  width: 80,
                  clipBehavior: Clip.none,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
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
