import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interactor/auth/auth_interactor.dart';
import 'routes/routes.dart';

void main() {
  runApp(
    ProviderScope(
      child: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: 'Pretendard Variable',
        ),
        child: BodyMood(),
      ),
    ),
  );
}

class BodyMood extends StatelessWidget {
  BodyMood({Key? key}) : super(key: key);

  final _navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navKey,
      theme: ThemeData(
        fontFamily: 'Pretendard Variable',
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff18192b),
              onPrimary: Colors.white,
            ),
      ),
      builder: (context, child) {
        return AuthInteractor(
          navKey: _navKey,
          child: child ?? const SizedBox.shrink(),
        );
      },
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
