import 'package:flutter/material.dart';

import '../../state/app_view_state.dart';

class AppViewInteractor extends ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = AppViewState.splash();

  void showSplashView() => _showView(AppViewState.splash());
  void showLoginView() => _showView(AppViewState.login());
  void showAlbumView() => _showView(AppViewState.album());
  void showEditorView() => _showView(AppViewState.editor());
  void showPreferencesView() => _showView(AppViewState.preferences());

  void _showView(AppViewState state) {
    _state = state;
    notifyListeners();
  }

  bool get onSplashView => _state.maybeMap(
        splash: (_) => true,
        orElse: () => false,
      );
  bool get onLoginView => _state.maybeMap(
        login: (_) => true,
        orElse: () => false,
      );
  bool get onAlbumView => _state.maybeMap(
        splash: (_) => false,
        login: (_) => false,
        orElse: () => true,
      );
  bool get onEditorView => _state.maybeMap(
        editor: (_) => true,
        orElse: () => false,
      );
  bool get onPreferencesView => _state.maybeMap(
        preferences: (_) => true,
        orElse: () => false,
      );
}
