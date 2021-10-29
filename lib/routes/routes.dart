// ignore_for_file: prefer_function_declarations_over_variables
import 'package:bodymood/gui/login/login_page.dart';
import 'package:bodymood/gui/posters/posters_page.dart';
import 'package:bodymood/gui/splash/splash.dart';
import 'package:bodymood/routes/path.dart';
import 'package:flutter/material.dart';

const _widgets = {
  BodyMoodPath.splash: BodyMoodSplashPage(),
  BodyMoodPath.home: BodyMoodSplashPage(),
  BodyMoodPath.login: LoginPage(),
  BodyMoodPath.posters: PostersPage(),
};

Route onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      final widget = _widgets[settings.name]!;
      return widget;
    },
  );
}
