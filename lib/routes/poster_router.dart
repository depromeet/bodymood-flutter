import '../bloc/posters/poster_editor_state_manager.dart';
import '../gui/create/create_poster_page.dart';
import '../gui/posters/posters_page.dart';

import 'path.dart';
import 'package:flutter/material.dart';

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
        if (posterEditorStateManager.isCreating) ...[
          CreatePosterPage.page(),
        ],
        if (posterEditorStateManager.isEditing) ...[],
      ],
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.create) {
      posterEditorStateManager.clear();
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
