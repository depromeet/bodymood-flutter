import 'dart:ui';

import 'package:bodymood/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Pretendard Variable',
        ),
        child: BodyMood(),
      ),
    ),
  );
}

class BodyMood extends StatelessWidget {
  const BodyMood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard Variable',
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff18192b),
              onPrimary: Colors.white,
            ),
      ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
