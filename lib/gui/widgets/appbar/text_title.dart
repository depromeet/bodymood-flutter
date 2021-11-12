import 'package:flutter/material.dart';

import '../../constants/color.dart';

class AppbarTextTitle extends StatelessWidget {
  const AppbarTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        height: 19 / 14,
        color: clPrimaryBlack,
      ),
    );
  }
}
