// ignore_for_file: prefer_function_declarations_over_variables
import 'package:bodymood/gui/login/login_page.dart';
import 'package:bodymood/gui/my_album/gui/my_album_page.dart';
import 'package:bodymood/gui/splash/gui/splash.dart';
import 'package:bodymood/routes/path.dart';
import 'package:flutter/material.dart';

const _widgets = {
  BodyMoodPath.home: BodyMoodMain(),
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
