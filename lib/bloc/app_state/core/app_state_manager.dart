import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/app_view/app_view_interactor_encloser.dart';
import '../../auth/controller/auth_token_manager_provider.dart';
import '../../auth/social/kakao/kakao_auth_provider.dart';
import '../../auth/social/kakao/kakao_auth_refresher.dart';
import 'model/app_state.dart';

final appStateManagerProvider = StateNotifierProvider((ref) {
  return AppStateManager(
    read: ref.read,
  );
});

class AppStateManager extends StateNotifier<AppState> {
  AppStateManager({required Reader read})
      : _read = read,
        super(AppState.none());

  final Reader _read;

  bool get isInitialized => state.maybeMap(
        initialized: (_) => true,
        orElse: () => false,
      );

  initialize() async {
    final authTokenManager = _read(authTokenManagerProvider);
    await authTokenManager.updateAuthToken(KakaoAuthRefresher());
    _setAppState(AppState.initialized());
  }

  resetApp() async {
    final authManager = _read(authTokenManagerProvider);
    await authManager.resetAuthToken(KakaoAuthProvider());
    _setAppState(AppState.none());
    _read(appViewPageEncloser).showSplashView();
  }

  void _setAppState(AppState appState) {
    state = appState;
  }
}
