import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';

class OpenMapButton extends StatelessWidget {
  final VoidCallback? onpressed;
  const OpenMapButton({Key? key, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Material(
          borderRadius: BorderRadius.circular(50),
          clipBehavior: Clip.antiAlias,
          color: AppTheme.palette.buttonOverlay,
          child: TextButton(
            onPressed: onpressed,
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              minimumSize: Size(0, 48),
              padding: EdgeInsets.symmetric(horizontal: 24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on,
                  color: AppTheme.palette.secondaryColor,
                ),
                Container(width: 4),
                Text(
                  "Map",
                  style: AppTheme.theme.textTheme.button,
                )
              ],
            ),
          )),
    );
  }
}
