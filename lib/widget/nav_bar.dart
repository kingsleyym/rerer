import 'package:flutter/material.dart';
import 'package:hayan_app/Pages/homepage.dart';
import 'package:hayan_app/Pages/helpPage.dart';
import 'package:hayan_app/Pages/servicepage.dart';
import 'package:hayan_app/Pages/me.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/drawer.dart';

import '../Pages/helpPage.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final _palette = AppTheme.palette;
  int _selected = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selected = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const DrawerBar(),
    const ServicePage(),
    const User(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selected],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 26, 25),
        child: Container(
          width: 340,
          height: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: _palette.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _button(
                index: 0,
                icon: Icons.home,
                selectedIndex: _selected,
              ),
              _button(
                index: 1,
                icon: Icons.favorite_border_outlined,
                selectedIndex: _selected,
              ),
              _button(
                index: 2,
                icon: Icons.shopping_cart_outlined,
                selectedIndex: _selected,
              ),
              _button(icon: Icons.person, selectedIndex: _selected, index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button({
    required int index,
    required IconData icon,
    VoidCallback? onPressed,
    int selectedIndex = 0,
  }) {
    bool isSelected = selectedIndex == index;
    return Material(
      color: isSelected ? AppTheme.palette.buttonOverlay : Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.antiAlias,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: Icon(
          icon,
          color: isSelected
              ? AppTheme.palette.secondaryColor
              : AppTheme.palette.buttonOverlay,
        ),
        onPressed: () {
          _selected = index;
          onPressed?.call();
          setState(() {});
        },
      ),
    );
  }
}
