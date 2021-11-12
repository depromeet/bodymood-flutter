import '../core/auth_state_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ds/auth_token.dart';
import 'inteface/server_auth_provider.dart';
import 'inteface/social_auth_provider.dart';

class AuthTokenManager {
  AuthTokenManager({
    required ServerAuthProviderBase server,
    required Reader reader,
  })  : _server = server,
        _read = reader;

  final ServerAuthProviderBase _server;
  final Reader _read;

  ServerAuthToken get authToken => _authToken;
  ServerAuthToken _authToken = const ServerAuthToken.unauthorizedToken();

  Future<ServerAuthToken> updateAuthToken(
    SocialAuthProviderBase provider,
  ) async {
    final socialToken = await provider.getToken();
    return socialToken.maybeMap(
      failed: (_) {
        return const ServerAuthToken.unauthorizedToken();
      },
      orElse: () async {
        _authToken = await _server.login(socialToken);
        _authToken.when(
          authorizedToken: (accessToken, refreshToken) {
            _read(authStateManagerProvider).loggedIn();
          },
          unauthorizedToken: () {},
        );
        return _authToken;
      },
    );
  }

  Future<bool> resetAuthToken() async {
    final didReset = await _server.logout();
    if (didReset) {
      _authToken = const ServerAuthToken.unauthorizedToken();
    }
    return didReset;
  }

  Future<ServerAuthToken> refreshAuthToken(
    SocialAuthProviderBase provider,
  ) async {
    _authToken = await _server.refresh(_authToken);
    return _authToken;
  }
}
