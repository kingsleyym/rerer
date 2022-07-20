import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/search_bar.dart';

class FavoriteButton extends StatelessWidget {
  final VoidCallback? onpressed;
  const FavoriteButton(
      {Key? key, this.onpressed, required Null Function() onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(50),
        clipBehavior: Clip.antiAlias,
        color: AppTheme.palette.buttonOverlayBorder,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  color: AppTheme.palette.inputTextField,
                  borderRadius: BorderRadius.circular(50)),
            ),
            Container(
              height: 42,
              width: 42,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onPressed,
                  child: Container(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.favorite_outline_outlined,
                      color: AppTheme.palette.secondaryColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
