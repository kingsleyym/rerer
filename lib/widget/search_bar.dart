import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback? onPressed;
  const SearchBar({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "Rechercher",
            prefixIcon: Icon(Icons.search_rounded),
            suffixIcon: _searchButton()),
      ),
    );
  }
}

Widget _searchButton() {
  return Container(
      padding: EdgeInsets.all(6),
      child: Material(
          color: AppTheme.palette.primaryColor,
          borderRadius: BorderRadius.circular(9),
          child: InkWell(
            child: Icon(Icons.checklist_rtl, color: Colors.white),
            onTap: onPressed,
          )));
}

void onPressed() {}
