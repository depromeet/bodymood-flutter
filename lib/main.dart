import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'encloser/app_view/app_view_interactor_encloser.dart';
import 'gui/constants/color.dart';
import 'routes/app_main_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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

class BodymoodApp extends ConsumerWidget {
  BodymoodApp({Key? key}) : super(key: key);

  final _navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context, ref) {
    final appViewInteractor = ref.watch(appViewPageEncloser.notifier);
    final mainBackButtonDispatcher = RootBackButtonDispatcher();
    var themeData = ThemeData(
      fontFamily: 'Pretendard Variable',
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: const Color(0xff18192b),
            onPrimary: Colors.white,
          ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.white,
        contentTextStyle: TextStyle(
          fontSize: 16,
          height: 19 / 16,
          color: clPrimaryBlack,
          fontWeight: FontWeight.w600,
        ),
        elevation: 4,
      ),
    );

    return MaterialApp(
      navigatorKey: _navKey,
      color: Colors.white,
      scrollBehavior: _VysorSupportedScrollBehavior(),
      theme: themeData,
      title: 'Bodymood',
      home: Router(
        routerDelegate: AppMainRouter(
          appViewInteractor: appViewInteractor,
        ),
        backButtonDispatcher: mainBackButtonDispatcher,
      ),
    );
  }
}

class _VysorSupportedScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
