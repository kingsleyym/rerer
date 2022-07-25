import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hayan_app/Pages/homepage.dart';
import 'package:hayan_app/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'Flutter hayan',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(12),
            fillColor: AppTheme.palette.secondaryColor,
            filled: true,
            prefixStyle: TextStyle(
              color: AppTheme.palette.accentColor,
              inherit: false,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.palette.secondaryColor),
              borderRadius: BorderRadius.circular(13),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.palette.accentColor),
              borderRadius: BorderRadius.circular(13),
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
