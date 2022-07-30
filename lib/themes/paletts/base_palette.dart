import 'package:flutter/material.dart';

class BasePalette {
  Color get debug => const Color(0xCCCC00CC);
  Color get error => const Color(0xFFEE2A34);
  Color get background => const Color(0xFFF0F3FF);
  Color get primaryColor => const Color(0xFF121212);
  Color get secondaryColor => Colors.white;
  Color get accentColor => Colors.green.shade500;

  Color get textHeadline => const Color(0xFF161849);
  Color get textBody => const Color(0xFFC4C4C4);
  Color get inputTextField => const Color(0xFF242A34);

  Color get buttonNavigation => const Color(0xFFfFFFFF);
  Color get buttonNavigationBorder => const Color(0xBFEEEEEE);

  Color get buttonOverlay => const Color(0xFF5E656D);
  Color get buttonOverlayBorder => const Color(0xBF242A34);
}
