import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bloc/app_state/core/app_state_manager.dart';
import 'bloc/auth/core/auth_state_manager.dart';
import 'routes/auth_router.dart';

void main() {
  runApp(
    ProviderScope(
      child: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: 'Pretendard Variable',
        ),
        child: BodymoodApp(),
      ),
    ),
  );
}

class VysorSupportedScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}

class BodymoodApp extends ConsumerWidget {
  BodymoodApp({Key? key}) : super(key: key);

  final _navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context, ref) {
    final authStateManager = ref.watch(authStateManagerProvider);
    final appStateManager = ref.watch(appStateManagerProvider);
    final authStateRouter = BodymoodAuthRouter(
      authManager: authStateManager,
      appStateManager: appStateManager,
    );

    return MaterialApp(
      navigatorKey: _navKey,
      color: Colors.white,
      scrollBehavior: VysorSupportedScrollBehavior(),
      theme: ThemeData(
        fontFamily: 'Pretendard Variable',
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff18192b),
              onPrimary: Colors.white,
            ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Bodymood',
      home: Router(
        routerDelegate: authStateRouter,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
