import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';

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
      height: 400,
      padding: EdgeInsets.all(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Text("map"),
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
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_outline),
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
    );
  }
}
