import 'package:bodymood/bloc/auth/core/auth_state_manager.dart';
import 'package:bodymood/bloc/auth/social/kakao/kakao_auth_provider.dart';
import 'package:bodymood/bloc/posters/riverpod/poster_album_provider.dart';
import 'package:bodymood/bloc/posters/riverpod/poster_index_provider.dart';
import 'package:bodymood/bloc/preferences/riverpod/preferences_manager_provider.dart';

import '../../auth/controller/auth_token_manager_provider.dart';
import '../../auth/social/kakao/kakao_auth_refresher.dart';

import 'model/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _appStateProvider = StateProvider((_) => AppState.initializing());

final appStateManagerProvider = Provider((ref) {
  final appState = ref.watch(_appStateProvider).state;
  return AppStateManager(read: ref.read, appState: appState);
});

class AppStateManager {
  AppStateManager({required Reader read, required AppState appState})
      : _read = read,
        _appState = appState;

  final Reader _read;
  final AppState _appState;

  bool get isInitialized => _appState.maybeMap(
        initialized: (_) => true,
        orElse: () => false,
      );

  void initialize() async {
    final authTokenManager = _read(authTokenManagerProvider);
    final authToken =
        await authTokenManager.updateAuthToken(KakaoAuthRefresher());
    authToken.when(
      authorizedToken: (_, __) async {
        final posters = _read(posterAlbumProvider.notifier);
        await posters.refresh();
      },
      unauthorizedToken: () {},
    );
    _setAppState(AppState.initialized());
  }

  resetApp() async {
    final authManager = _read(authTokenManagerProvider);
    final authStateManager = _read(authStateManagerProvider);
    final preferencesManager = _read(preferencesManageProvider);
    final posterIndexManager = _read(posterViewIndexProvider);

    preferencesManager.closePreferences();
    posterIndexManager.state = -1;
    await authManager.resetAuthToken(KakaoAuthProvider());
    authStateManager.loggedOut();

    _setAppState(AppState.none());
  }

  void _setAppState(AppState appState) {
    _read(_appStateProvider).state = appState;
  }
}
