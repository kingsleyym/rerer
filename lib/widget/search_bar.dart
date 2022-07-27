import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback? onPressed;
  const SearchBar({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "Rechercher",
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: _searchButton()),
      ),
    );
  }
}

Widget _searchButton() {
  return Container(
      padding: const EdgeInsets.all(6),
      child: Material(
          color: AppTheme.palette.primaryColor,
          borderRadius: BorderRadius.circular(9),
          child: const InkWell(
            onTap: onPressed,
            child: Icon(Icons.checklist_rtl, color: Colors.white),
          )));
}

void onPressed() {}
