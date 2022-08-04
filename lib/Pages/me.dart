import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AppBAr());
  }
}

class AppBAr extends StatelessWidget {
  const AppBAr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 0, right: 0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (ZoomDrawer.of(context)!.isOpen()) {
                          ZoomDrawer.of(context)!.close();
                        } else {
                          ZoomDrawer.of(context)!.open();
                        }
                      },
                      icon: Container(
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      )),
                  Spacer(),
                  NotifyIconButton()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
