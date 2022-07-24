// import 'package:flutter/material.dart';
// import 'package:hayan_app/themes/app_theme.dart';
// import 'package:hayan_app/widget/site_card.dart';
// import 'package:hayan_app/Models/site_infos.dart';

// class SiteInfosPage extends StatefulWidget {
//   const SiteInfosPage({Key? key, required this.siteInfos}) : super(key: key);

//   @override
//   State<SiteInfosPage> createState() => _SiteInfosPageState();
// }

// class _SiteInfosPageState extends State<SiteInfosPage> {
//   late SiteInfos _siteInfos;
//   late SiteCardOverlayInfos _cardOverlay;

//   @override
//   void @override
//   void initState() {
//     super.initState();
//     _siteInfos = widget.siteInfos;
//     _cardOverlay = SiteCardOverlayInfos(siteInfos: _siteInfos);

//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.fromLTRB(16, 48, 16, 48),
//         child: _pageBuilder(),
//       ),
//     );
//   }

//   Widget _pageBuilder(){
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SiteCard(siteInfos: _siteInfos,
//           overlay: _cardOverlay,),
//       ),
//       Padding(padding: const EdgeInsets.all(12),
//       child: Column(
//         children: [
//           text(_siteInfos.atelier.toString(),)
//         ]
//       ))
//         ],
//       ),
//     )
//   }
// }
