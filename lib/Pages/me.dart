import 'package:flutter/material.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 16, right: 16),
                      child: Row(
                        children: [
                          Icon(Icons.menu),
                          Spacer(),
                          NotifyIconButton()
                        ],
                      ),
                    ),
                    Center(
                      child: Text("Hello World"),
                    ),
                  ],
                ),
              ),
            )));
  }
}
