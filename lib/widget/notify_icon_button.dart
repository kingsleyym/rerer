import 'package:flutter/material.dart';

class NotifyIconButton extends StatelessWidget {
  final bool isNotified;
  const NotifyIconButton({Key? key, this.isNotified: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(9),
        child: InkWell(child: Icon(Icons.notifications)),
      ),
    );
  }
}
