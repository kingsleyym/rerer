import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/search_bar.dart';

import '../Pages/panoramasite.dart';

class VrButton extends StatelessWidget {
  final VoidCallback? onpressed;
  final Icon icon;
  const VrButton(
      {Key? key,
      this.onpressed,
      required Null Function() onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      clipBehavior: Clip.antiAlias,
      color: AppTheme.palette.buttonOverlay,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                color: AppTheme.palette.secondaryColor,
                borderRadius: BorderRadius.circular(50)),
          ),
          SizedBox(
            height: 42,
            width: 42,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    icon: icon),
              ),
            ),
          )
        ],
      ),
    );
  }
}
