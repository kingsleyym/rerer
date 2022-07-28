import 'package:flutter/material.dart';
import 'package:hayan_app/themes/paletts/base_palette.dart';

class BaseTheme {
  final BasePalette _palette = BasePalette();
  BasePalette get palette => _palette;

  ThemeData get themeData => ThemeData(
        fontFamily: "Roboto",
        brightness: Brightness.light,
        scaffoldBackgroundColor: _palette.background,
        primaryColor: _palette.primaryColor,
        // ignore: deprecated_member_use
        accentColor: _palette.accentColor,
        focusColor: _palette.secondaryColor,
        hintColor: _palette.textBody,
        textTheme: TextTheme(
          headline4: TextStyle(
              color: _palette.textHeadline,
              fontWeight: FontWeight.bold,
              fontSize: 24),
          headline5: TextStyle(
              color: _palette.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24),
          subtitle1: TextStyle(
            color: _palette.accentColor,
          ),
          subtitle2: TextStyle(
            color: _palette.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          caption: TextStyle(
            color: _palette.secondaryColor,
          ),
          bodyText2: TextStyle(
            color: _palette.textBody,
          ),
          button: TextStyle(
            color: _palette.secondaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(12),
            fillColor: _palette.secondaryColor,
            filled: true,
            prefixStyle: TextStyle(
              color: _palette.accentColor,
              inherit: false,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: palette.secondaryColor),
              borderRadius: BorderRadius.circular(13),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: palette.accentColor),
              borderRadius: BorderRadius.circular(13),
            )),
      );
}
