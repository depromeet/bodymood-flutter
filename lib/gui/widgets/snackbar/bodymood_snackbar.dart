import 'package:flutter/material.dart';

class BodymoodSnackbar extends SnackBar {
  BodymoodSnackbar({
    Key? key,
    required String message,
    double bottom = 96,
  }) : super(
          key: key,
          content: IntrinsicHeight(child: Center(child: Text(message))),
          margin: EdgeInsets.fromLTRB(24, 0, 24, bottom),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 4,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 2000),
        );
}
