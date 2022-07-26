import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hayan_app/Pages/homepage.dart';
import 'package:hayan_app/provider/navigation_provider.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/drawer.dart';
import 'package:hayan_app/widget/nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
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
                  borderSide:
                      BorderSide(color: AppTheme.palette.secondaryColor),
                  borderRadius: BorderRadius.circular(13),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.palette.accentColor),
                  borderRadius: BorderRadius.circular(13),
                )),
          ),
          debugShowCheckedModeBanner: false,
          home: DrawerBar(),
        ),
      ),
    );
  }
}
