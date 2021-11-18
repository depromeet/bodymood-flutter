import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/auth_state_manager.dart';
import 'ds/auth_token.dart';
import 'inteface/server_auth_provider.dart';
import 'inteface/social_auth_provider.dart';

class BodymoodAuthTokenManager {
  BodymoodAuthTokenManager({
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
        _authToken = const ServerAuthToken.unauthorizedToken();
        return _authToken;
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

  Future resetAuthToken(
    SocialAuthProviderBase socialProvider,
  ) async {
    await socialProvider.reset();
    await _server.logout();
    _authToken = const ServerAuthToken.unauthorizedToken();
  }

  Future<ServerAuthToken> refreshAuthToken(
    SocialAuthProviderBase provider,
  ) async {
    _authToken = await _server.refresh(_authToken);
    return _authToken;
  }
}
