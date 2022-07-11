import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  dynamic leading;
  AppBarWidget({
    Key? key,
    required this.title,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(title!),
    );
  }
}
