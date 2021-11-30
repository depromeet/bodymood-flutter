import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../encloser/app_view/app_view_interactor_encloser.dart';
import '../encloser/preferences_view/preferences_page_encloser.dart';
import '../gui/preferences/preferences_page.dart';
import 'path.dart';

class PreferencesRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  PreferencesRouter();

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final pageEncloser = ref.watch(preferencesViewPageEncloser);
      return Navigator(
        key: navigatorKey,
        onPopPage: (route, result) =>
            _onPopPage(route, result, pageEncloser, ref.read),
        pages: [
          if (pageEncloser.onMain) PreferencesPage.page(),
        ],
      );
    });
  }

  bool _onPopPage(
    Route<dynamic> route,
    result,
    PreferencesPageEncloser pageEncloser,
    Reader read,
  ) {
    if (!route.didPop(result)) {
      return false;
    }
    final path = route.settings.name;
    if (path == BodymoodPath.preferences) {
      read(appViewPageEncloser).showAlbumView();
    }
    if (path == BodymoodPath.preferencesAgreement) {
      pageEncloser.showMain();
    }
    if (path == BodymoodPath.preferencesLogout) {
      pageEncloser.showMain();
    }
    if (path == BodymoodPath.preferencesSignout) {
      pageEncloser.showMain();
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
