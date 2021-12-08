import 'package:flutter/material.dart';

class HummingSnackbar extends SnackBar {
  HummingSnackbar({
    Key? key,
    required String message,
  }) : super(
          key: key,
          content: IntrinsicHeight(child: Center(child: Text(message))),
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 96),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 4,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 2000),
        );
}
