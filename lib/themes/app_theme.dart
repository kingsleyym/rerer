import 'package:hayan_app/themes/paletts/base_palette.dart';

import 'package:hayan_app/themes/base_them.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static BaseTheme _current = BaseTheme();
  static change(BaseTheme theme) {
    _current = theme;
  }

  static ThemeData get theme => _current.themeData;
  static BasePalette get palette => _current.palette;
}
