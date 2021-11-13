import 'package:bodymood/gui/editor/preview/preview_page.dart';
import 'package:flutter/material.dart';

import '../bloc/editor/poster_editor_state_manager.dart';
import '../gui/create/create_poster_page.dart';
import '../gui/editor/poster_editor_page.dart';
import '../gui/editor/emotion_selector/emotion_selector_page.dart';
import '../gui/editor/exercise_selector/exercise_selector.dart';
import '../gui/posters/posters_page.dart';
import 'path.dart';

class BodymoodPosterRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  BodymoodPosterRouter({
    required this.posterEditorStateManager,
    GlobalKey<NavigatorState>? navigatorKey,
  }) : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final PosterEditorStateManager posterEditorStateManager;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: [
        PostersPage.page(),
        if (posterEditorStateManager.isCreatingMode) ...[
          CreatePosterPage.page(),
        ],
        if (!posterEditorStateManager.isPreviewMode &&
            posterEditorStateManager.templateSelected) ...[
          PosterEditorPage.page(),
        ],
        if (posterEditorStateManager.isPreviewMode) ...[
          PosterPreviewPage.page(),
        ],
        if (posterEditorStateManager.isSelectingExercises) ...[
          ExerciseSelectorPage.page(),
        ] else if (posterEditorStateManager.isSelectingEmotion) ...[
          EmotionSelectorPage.page(),
        ],
      ],
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.create || path == BodymoodPath.editorPreview) {
      posterEditorStateManager.clearAll();
    }

    if (path == BodymoodPath.editor) {
      posterEditorStateManager.clearTemplate();
    }

    if (path == BodymoodPath.selectEmotion ||
        path == BodymoodPath.selectExercises ||
        path == BodymoodPath.selectImage) {
      posterEditorStateManager.finishItemSelection();
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
