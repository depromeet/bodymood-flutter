import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../encloser/editor_view/editor_view_page_encloser.dart';
import '../gui/login/login_page.dart';
import '../gui/posters/posters_page.dart';
import '../gui/preferences/preferences_page.dart';
import '../gui/splash/splash.dart';
import '../interactor/app_view/app_view_interactor.dart';
import '../interactor/editor_view/editor_page_interactor.dart';
import 'editor_router.dart';
import 'path.dart';

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
        final editorPageInteractor = ref.watch(editorViewPageEncloser.notifier);
        final editorView = _buildEditorView(editorPageInteractor, context);

        return Navigator(
          key: navigatorKey,
          onPopPage: _onPopPage,
          pages: [
            if (appViewInteractor.onSplashView) BodyMoodSplashPage.page(),
            if (appViewInteractor.onLoginView) LoginPage.page(),
            if (appViewInteractor.onAlbumView) AlbumPage.page(),
            if (appViewInteractor.onEditorView) editorView,
            if (appViewInteractor.onPreferencesView) PreferencesPage.page(),
          ],
        );
      },
    );
  }

  MaterialPage<dynamic> _buildEditorView(
      EditorViewPageInteractor editorPageInteractor, BuildContext context) {
    return MaterialPage(
      name: BodymoodPath.create,
      key: const ValueKey(BodymoodPath.create),
      child: Router(
        routerDelegate:
            PosterEditorRouter(editorPageInteractor: editorPageInteractor),
        backButtonDispatcher: Router.of(context)
            .backButtonDispatcher
            ?.createChildBackButtonDispatcher()
          ?..takePriority(),
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.login) {
      appViewInteractor.showSplashView();
    }
    if (path == BodymoodPath.editor) {
      appViewInteractor.showAlbumView();
    }
    if (path == BodymoodPath.create) {
      appViewInteractor.showAlbumView();
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
