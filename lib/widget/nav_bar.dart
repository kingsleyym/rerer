import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final _palette = AppTheme.palette;
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
    );
  }

Widget _button({
  required int index,
  required IconData icon,
  VoidCallback? onPressed,
  int selectedIndex: 0,
}) {
  bool isSelected = selectedIndex == index;
  return Material(
    color: isSelected ? AppTheme.palette.buttonOverlay : Colors.transparent,
    borderRadius: BorderRadius.circular(13),
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
