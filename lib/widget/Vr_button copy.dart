import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/search_bar.dart';

import '../Pages/panoramasite.dart';

class VrButton extends StatelessWidget {
  final VoidCallback? onpressed;
  const VrButton({Key? key, this.onpressed, required Null Function() onPressed})
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
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        icon: Icon(
                          size: 18,
                          Icons.view_in_ar_rounded,
                          color: AppTheme.palette.accentColor,
                        )),
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
