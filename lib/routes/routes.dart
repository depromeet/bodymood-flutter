// ignore_for_file: prefer_function_declarations_over_variables
import 'package:bodymood/gui/login/login_page.dart';
import 'package:bodymood/gui/my_album/gui/my_album_page.dart';
import 'package:bodymood/gui/splash/gui/splash.dart';
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

  final GotoHandler main = (context) => _goto(context, BodyMoodMain.route);
  final GotoHandler login = (context) => _goto(context, LoginPage.route);
  final GotoHandler myAlbum = (context) => _goto(context, MyAlbumPage.route);
}

class BodyMoodReplacer extends BodyMoodRoute {
  static void _goto(BuildContext context, String path) {
    Navigator.of(context).pushReplacementNamed(path);
  }
}
