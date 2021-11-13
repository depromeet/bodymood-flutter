import 'package:flutter/material.dart';

import '../bloc/app_state/core/app_state_manager.dart';
import '../bloc/auth/core/auth_state_manager.dart';
import '../gui/login/login_page.dart';
import '../gui/posters/posters_router.dart';
import '../gui/splash/splash.dart';
import 'path.dart';

class BodymoodAuthRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  BodymoodAuthRouter({
    required this.authManager,
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthStateManager authManager;
  final AppStateManager appStateManager;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: [
        if (!appStateManager.isInitialized) ...[
          BodyMoodSplashPage.page(),
        ] else if (authManager.isLoggedIn) ...[
          PostersPageRouter.page(),
        ] else ...[
          LoginPage.page(),
        ],
      ],
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.posters) {
      authManager.loggedOut();
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
