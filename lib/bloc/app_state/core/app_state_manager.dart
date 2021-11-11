import 'model/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _appStateProvider = StateProvider((_) => AppState.initializing());

final appStateManageProvider = Provider((ref) {
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

  void initialized() {
    _setAppState(AppState.initialized());
  }

  void resetApp() {
    _setAppState(AppState.none());
  }

  void _setAppState(AppState appState) {
    _read(_appStateProvider).state = appState;
  }
}
