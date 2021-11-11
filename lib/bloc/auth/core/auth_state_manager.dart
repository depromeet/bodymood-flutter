import 'model/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authStateProvider =
    StateProvider<AuthState>((ref) => AuthState.loggedOut());

final authStateManagerProvider = Provider<AuthStateManager>((ref) {
  final authState = ref.watch(_authStateProvider);
  return AuthStateManager(read: ref.read, state: authState.state);
});

class AuthStateManager {
  AuthStateManager({
    required Reader read,
    required AuthState state,
  })  : _read = read,
        _state = state;
  final Reader _read;
  final AuthState _state;

  bool get isLoggedIn =>
      _state.maybeMap(orElse: () => false, loggedIn: (_) => true);

  void loggedIn() => _setAuthState(AuthLoggedInState());
  void loggedOut() => _setAuthState(AuthLoggedOutState());
  void authorizing() => _setAuthState(AuthAuthorizingState());

  void _setAuthState(AuthState state) {
    _read(_authStateProvider).state = state;
  }
}
