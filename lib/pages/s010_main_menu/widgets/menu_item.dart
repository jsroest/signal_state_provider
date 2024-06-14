import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: onTap,
    );
  }
}
