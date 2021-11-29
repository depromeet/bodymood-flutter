import 'package:flutter/material.dart';

import '../gui/create/create_poster_page.dart';
import '../gui/editor/emotion_selector/emotion_selector_page.dart';
import '../gui/editor/exercise_selector/exercise_selector.dart';
import '../gui/editor/poster_editor_page.dart';
import '../gui/editor/preview/preview_page.dart';
import '../interactor/editor_view/editor_page_interactor.dart';
import 'path.dart';

class PosterEditorRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  PosterEditorRouter({
    required this.editorPageInteractor,
  }) {
    editorPageInteractor.addListener(notifyListeners);
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'editor-router');
  final EditorViewPageInteractor editorPageInteractor;

  @override
  void dispose() {
    editorPageInteractor.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: [
        if (editorPageInteractor.onTemplatePage) CreatePosterPage.page(),
        if (editorPageInteractor.onEditorPage) PosterEditorPage.page(),
        if (editorPageInteractor.onExercisePage) ExerciseSelectionPage.page(),
        if (editorPageInteractor.onMoodPage) MoodSelectionPage.page(),
        if (editorPageInteractor.onSharePage) SharePosterPage.page(),
      ],
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.create) {
      editorPageInteractor.closeEditor();
    }
    if (path == BodymoodPath.editor) {
      editorPageInteractor.showTemplatePage();
    }
    if (path == BodymoodPath.editorPreview) {
      editorPageInteractor.closeEditor();
    }
    if (path == BodymoodPath.selectExercises ||
        path == BodymoodPath.selectEmotion ||
        path == BodymoodPath.selectImage) {
      editorPageInteractor.showEditorPage();
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
