import 'package:flutter/material.dart';

class NotifyIconButton extends StatelessWidget {
  final bool isNotified;
  const NotifyIconButton({Key? key, this.isNotified = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(9),
      child: const InkWell(child: Icon(Icons.notifications)),
    );
  }
}
