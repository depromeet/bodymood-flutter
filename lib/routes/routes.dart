// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bodymood/login/gui/login_page.dart';
import 'package:bodymood/my_album/gui/my_album_page.dart';
import 'package:bodymood/splash/gui/splash.dart';
import 'package:flutter/material.dart';

const _widgets = {
  BodyMoodMain.route: BodyMoodMain(),
  LoginPage.route: LoginPage(),
  MyAlbumPage.route: MyAlbumPage(),
};

Route onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      final widget = _widgets[settings.name]!;
      return widget;
    },
  );
}

final goto = BodyMoodRoute();
final replace = BodyMoodReplacer();

typedef GotoHandler = void Function(BuildContext);

class BodyMoodRoute {
  static void _goto(BuildContext context, String path) {
    Navigator.of(context).pushNamed(path);
  }

  final GotoHandler main = (context) => _goto(context, '/');
  final GotoHandler login = (context) => _goto(context, '/login');
  final GotoHandler myAlbum = (context) => _goto(context, '/my-album');
}

class BodyMoodReplacer extends BodyMoodRoute {
  static void _goto(BuildContext context, String path) {
    Navigator.of(context).pushReplacementNamed(path);
  }
}
