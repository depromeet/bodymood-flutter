import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/editor/poster_editor_state_manager.dart';
import '../bloc/preferences/preferences_state_manager.dart';
import '../gui/create/create_poster_page.dart';
import '../gui/editor/emotion_selector/emotion_selector_page.dart';
import '../gui/editor/exercise_selector/exercise_selector.dart';
import '../gui/editor/poster_editor_page.dart';
import '../gui/editor/preview/preview_page.dart';
import '../gui/posters/poster_view_page.dart';
import '../gui/posters/posters_page.dart';
import '../gui/preferences/preferences_router_root.dart';
import 'path.dart';

class BodymoodPosterRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  BodymoodPosterRouter({
    required this.posterEditorStateManager,
    required this.posterViewIndex,
    required this.preferencesStateManager,
    GlobalKey<NavigatorState>? navigatorKey,
  }) : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final PosterEditorStateManager posterEditorStateManager;
  final PreferencesStateManager preferencesStateManager;
  final StateController<int> posterViewIndex;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: [
        AlbumPage.page(),
        if (posterViewIndex.state != -1) ...[
          PosterViewPage.page(),
        ] else ...[
          if (posterEditorStateManager.isCreatingMode) ...[
            CreatePosterPage.page(),
          ],
          if (!posterEditorStateManager.isPreviewMode &&
              posterEditorStateManager.templateSelected) ...[
            PosterEditorPage.page(),
          ],
          if (posterEditorStateManager.isPreviewMode) ...[
            SharePosterPage.page(),
          ],
          if (posterEditorStateManager.isSelectingExercises) ...[
            ExerciseSelectionPage.page(),
          ] else if (posterEditorStateManager.isSelectingEmotion) ...[
            MoodSelectionPage.page(),
          ],
        ],
        if (preferencesStateManager.showPreferences) ...[
          PreferencesPageRouter.page(),
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

    if (path == BodymoodPath.posterView) {
      posterViewIndex.state = -1;
    }

    if (path == BodymoodPath.preferences) {
      preferencesStateManager.closePreferences();
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
