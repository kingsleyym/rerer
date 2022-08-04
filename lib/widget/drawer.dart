import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hayan_app/Models/menu_model.dart';
import 'package:hayan_app/Pages/helpPage.dart';
import 'package:hayan_app/Pages/homepage.dart';
import 'package:hayan_app/Pages/me.dart';
import 'package:hayan_app/Pages/servicepage.dart';
import 'package:hayan_app/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

import 'menuScreen.dart';

class DrawerBar extends StatefulWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      reverseDuration: Duration(milliseconds: 600),
      duration: Duration(milliseconds: 250),
      shadowLayer1Color: Color.fromARGB(255, 55, 55, 55),
      showShadow: true,
      menuScreenTapClose: true,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
      angle: 0,
      borderRadius: 29,
      menuBackgroundColor: Color.fromARGB(255, 39, 84, 83),
      controller: zoomDrawerController,
      mainScreen: buildPages(),
      menuScreen: MenuScreen(),
    );
  }

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.homescreen:
        return HomePage();
      case NavigationItem.planer:
        return HelpPage();
      case NavigationItem.service:
        return ServicePage();
      case NavigationItem.user:
        return User();
      case NavigationItem.header:
        return HelpPage(); // TODO: Handle this case.

      case NavigationItem.roadmap:
        // TODO: Handle this case.
        return HelpPage();
    }
  }
}
