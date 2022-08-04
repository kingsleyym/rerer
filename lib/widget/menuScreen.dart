import 'package:flutter/material.dart';
import 'package:hayan_app/provider/navigation_provider.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:provider/provider.dart';
import '../Models/menu_model.dart';

class MenuScreen extends StatelessWidget {
  static final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 39, 84, 83),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0, left: 25),
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Luca Kingsley",
                      style: AppTheme.theme.textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                          height: 0.9,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text("Luca Kingsley")
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          menuDsta(context),
          const SizedBox(
            height: 180,
          ),
          Container(
            height: 50,
            width: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment(0.1, 0),
                  image: AssetImage('assets/images/aleflogo.png'),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ]),
      ),
    );
  }

  Container menuDsta(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 14,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.homescreen,
            text: "Homepage",
            icon: Icons.home_rounded,
          ),
          const SizedBox(
            height: 1,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.roadmap,
            text: "Road Map",
            icon: Icons.rocket_launch_rounded,
          ),
          const SizedBox(
            height: 1,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.service,
            text: "Servive",
            icon: Icons.self_improvement_outlined,
          ),
          const SizedBox(
            height: 1,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.planer,
            text: "Calender",
            icon: Icons.wifi_channel_rounded,
          ),
          const SizedBox(
            height: 1,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.user,
            text: "User",
            icon: Icons.castle_rounded,
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        selected: isSelected,
        iconColor: const Color.fromARGB(255, 109, 109, 109),
        textColor: const Color.fromARGB(255, 157, 157, 157),
        selectedColor: Colors.white,
        minLeadingWidth: 20,
        leading: Icon(
          icon,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () => selectItem(context, item),
      ),
    );
  }
}

selectItem(BuildContext context, NavigationItem item) {
  final provider = Provider.of<NavigationProvider>(context, listen: false);
  provider.setNavigationItem(item);
}
