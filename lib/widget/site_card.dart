import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';
import 'package:hayan_app/widget/favorite_button.dart';
import 'package:hayan_app/widget/open_map_button.dart';
import 'favorite_button.dart';
import 'package:hayan_app/Pages/panoramasite.dart';

class SiteCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String siteName;
  final String address;
  const SiteCard({
    Key? key,
    required this.siteName,
    required this.address,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 420,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(0, 12),
              color: Colors.black26,
            )
          ],
        ),
        child: Container(
          height: 400,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.black12,
              Colors.black54,
            ], stops: [
              0.5,
              0.75,
              1
            ]),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FavoriteButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ),
                  Spacer(),
                  OpenMapButton(),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      siteName,
                      style: AppTheme.theme.textTheme.headline5,
                      maxLines: 2,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: FavoriteButton(
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Container(
                height: 12,
              ),
              Text(
                address,
                style: AppTheme.theme.textTheme.caption,
              ),
            ],
          ),
        ));
  }
}
