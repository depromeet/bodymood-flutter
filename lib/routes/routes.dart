// ignore_for_file: prefer_function_declarations_over_variables
import 'package:bodymood/gui/create/create_poster_page.dart';
import 'package:bodymood/gui/edit/edit_poster.dart';
import 'package:bodymood/gui/edit/emotion_selector/emotion_selector.dart';
import 'package:bodymood/gui/edit/exercise_selector/exercise_selector.dart';
import 'package:bodymood/gui/login/login_page.dart';
import 'package:bodymood/gui/posters/posters_page.dart';
import 'package:bodymood/gui/splash/splash.dart';
import 'package:bodymood/routes/path.dart';
import 'package:flutter/material.dart';

const _widgets = {
  BodymoodPath.splash: BodyMoodSplashPage(),
  BodymoodPath.home: PostersPage(),
  BodymoodPath.login: LoginPage(),
  BodymoodPath.posters: PostersPage(),
  BodymoodPath.create: CreatePosterPage(),
  BodymoodPath.edit: EditPosterPage(),
  BodymoodPath.chooseEmotion: EmotionSelectorPage(),
  BodymoodPath.chooseExercise: ExerciseSelectorPage(),
};

Route onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      final widget = _widgets[settings.name]!;
      return widget;
    },
  );
}
