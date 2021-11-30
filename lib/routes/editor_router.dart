import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../encloser/editor_view/editor_view_page_encloser.dart';
import '../gui/create/create_poster_page.dart';
import '../gui/editor/emotion_selector/emotion_selector_page.dart';
import '../gui/editor/exercise_selector/exercise_selector.dart';
import '../gui/editor/poster_editor_page.dart';
import '../gui/editor/preview/preview_page.dart';
import '../interactor/editor_view/editor_page_interactor.dart';
import 'path.dart';

class PosterEditorRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  PosterEditorRouter();

  @override
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'editor-router');

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final editorViewPageInteractor = ref.watch(editorViewPageEncloser);
      return Navigator(
        key: navigatorKey,
        onPopPage: (route, result) =>
            _onPopPage(route, result, editorViewPageInteractor),
        pages: [
          if (editorViewPageInteractor.onTemplatePage) CreatePosterPage.page(),
          if (editorViewPageInteractor.onEditorPage) PosterEditorPage.page(),
          if (editorViewPageInteractor.onExercisePage)
            ExerciseSelectionPage.page(),
          if (editorViewPageInteractor.onMoodPage) MoodSelectionPage.page(),
          if (editorViewPageInteractor.onSharePage) SharePosterPage.page(),
        ],
      );
    });
  }

  bool _onPopPage(
      Route<dynamic> route, result, EditorViewPageInteractor interactor) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.create) {
      interactor.closeEditor();
    }
    if (path == BodymoodPath.editor) {
      interactor.showTemplatePage();
    }
    if (path == BodymoodPath.editorPreview) {
      interactor.closeEditor();
    }
    if (path == BodymoodPath.selectExercises ||
        path == BodymoodPath.selectEmotion ||
        path == BodymoodPath.selectImage) {
      interactor.showEditorPage();
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
