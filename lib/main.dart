import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interactor/auth_interactor.dart';
import 'routes/routes.dart';

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
      builder: (context, child) {
        return AuthInteractor(child: child ?? SizedBox.shrink());
      },
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
