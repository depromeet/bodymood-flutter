import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/posters/riverpod/poster_album_provider.dart';
import '../gui/login/login_page.dart';
import '../gui/posters/posters_page.dart';
import '../gui/splash/splash.dart';
import '../interactor/app_view/app_view_interactor.dart';
import 'editor_router.dart';
import 'path.dart';
import 'preferencse_router.dart';

class AppMainRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AppMainRouter({
    required this.appViewInteractor,
  }) {
    appViewInteractor.addListener(notifyListeners);
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final AppViewInteractor appViewInteractor;

  @override
  void dispose() {
    appViewInteractor.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Navigator(
          key: navigatorKey,
          onPopPage: (routes, results) => _onPopPage(routes, results, ref),
          pages: [
            if (appViewInteractor.onSplashView) BodyMoodSplashPage.page(),
            if (appViewInteractor.onLoginView) LoginPage.page(),
            if (appViewInteractor.onAlbumView) ...[
              AlbumPage.page(),
            ],
            if (appViewInteractor.onEditorView) _buildEditorView(context),
            if (appViewInteractor.onPreferencesView)
              _buildPreferencesView(context),
          ],
        );
      },
    );
  }

  MaterialPage<dynamic> _buildEditorView(
    BuildContext context,
  ) {
    return MaterialPage(
      name: BodymoodPath.create,
      key: const ValueKey(BodymoodPath.create),
      child: Router(
        routerDelegate: PosterEditorRouter(),
        backButtonDispatcher: Router.of(context)
            .backButtonDispatcher
            ?.createChildBackButtonDispatcher()
          ?..takePriority(),
      ),
    );
  }

  MaterialPage<dynamic> _buildPreferencesView(
    BuildContext context,
  ) {
    return MaterialPage(
      name: BodymoodPath.create,
      key: const ValueKey(BodymoodPath.create),
      child: Router(
        routerDelegate: PreferencesRouter(),
        backButtonDispatcher: Router.of(context)
            .backButtonDispatcher
            ?.createChildBackButtonDispatcher()
          ?..takePriority(),
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, result, WidgetRef ref) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.login) {
      appViewInteractor.showSplashView();
    }
    if (path == BodymoodPath.editor) {
      appViewInteractor.showAlbumView();
      ref.read(posterAlbumProvider.notifier).refresh();
    }
    if (path == BodymoodPath.create) {
      appViewInteractor.showAlbumView();
      ref.read(posterAlbumProvider.notifier).refresh();
    }
    if (path == BodymoodPath.preferences) {
      appViewInteractor.showAlbumView();
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
