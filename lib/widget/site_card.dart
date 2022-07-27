// import 'package:flutter/material.dart';
// import 'package:hayan_app/themes/app_theme.dart';
// import 'package:hayan_app/widget/favorite_button.dart';
// import 'package:hayan_app/widget/open_map_button.dart';
// import 'package:hayan_app/widget/site_card_overlay_home.dart';
// import '../Models/site_infos.dart';
// import 'vr_button.dart';
// import 'package:hayan_app/Pages/panoramasite.dart';

// class SiteCard extends StatelessWidget {

//   const SiteCard({
//     Key? key,

//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 400,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             alignment: const Alignment(0.1, 0),
//             image: AssetImage("assets/images/ZweiBet-2"),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             const BoxShadow(
//               blurRadius: 15,
//               offset: Offset(0, 12),
//               color: Colors.black26,
//             )
//           ],
//         ),
//         child: Container(
//           height: 400,
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(colors: [
//               Colors.transparent,
//               Colors.black12,
//               Colors.black54,
//             ], stops: [
//               0.5,
//               0.75,
//               1
//             ]),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Container(
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, "site-Infos", arguments: siteInfos);
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 VrButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const MyHomePage()),
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 const OpenMapButton(),
//               ],
//             ),
//             const Spacer(),
//             Row(
//               children: [
//                 Container(
//                   width: 150,
//                   child: Text(
//                     siteInfos.name ?? "",
//                     style: AppTheme.theme.textTheme.headline5,
//                     maxLines: 2,
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 18.0),
//                   child: FavoriteButton(
//                     onPressed: () {},
//                   ),
//                 )
//               ],
//             ),
//             Container(
//               height: 12,
//             ),
//             Text(
//               siteInfos.address ?? "",
//               style: AppTheme.theme.textTheme.caption,
//             ),
//           ],
//         ),
//       ),
//     );
//         ));
//   }
// }
