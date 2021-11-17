import 'package:bodymood/bloc/preferences/preferences_state_manager.dart';
import 'package:bodymood/gui/preferences/preferences_page.dart';
import 'package:flutter/material.dart';

import 'path.dart';

class PreferencesRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  PreferencesRouter({
    required this.prefManager,
  }) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final PreferencesStateManager prefManager;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: [
        PreferencesPage.page(),
        if (prefManager.agreementOpen) ...[],
      ],
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.preferences) {
      prefManager.closePreferences();
    }
    if (path == BodymoodPath.preferencesAgreement) {
      prefManager.closeMenu();
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
