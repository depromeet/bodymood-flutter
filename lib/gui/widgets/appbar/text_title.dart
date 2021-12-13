import 'package:flutter/material.dart';

import '../../constants/color.dart';

class AppbarTextTitle extends StatelessWidget {
  const AppbarTextTitle({
    Key? key,
    required this.title,
    this.titleColor = clPrimaryBlack,
  }) : super(key: key);

  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        height: 19 / 14,
        color: titleColor,
      ),
    );
  }
}
