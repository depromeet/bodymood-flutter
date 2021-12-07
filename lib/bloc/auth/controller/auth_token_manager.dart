import 'ds/auth_token.dart';
import 'inteface/server_auth_provider.dart';
import 'inteface/social_auth_provider.dart';

class BodymoodAuthTokenManager {
  BodymoodAuthTokenManager({
    required ServerAuthProviderBase server,
  }) : _server = server;

  final ServerAuthProviderBase _server;

  ServerAuthToken get authToken => _authToken;
  ServerAuthToken _authToken = const ServerAuthToken.unauthorizedToken();

  bool get isLoggedIn => authToken.maybeMap(
        orElse: () => false,
        authorizedToken: (_) => true,
      );

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
        return _authToken;
      },
    );
  }

  Future resetAuthToken(
    SocialAuthProviderBase socialProvider,
  ) async {
    await _server.logout();
    await socialProvider.reset();
    _authToken = const ServerAuthToken.unauthorizedToken();
  }

  Future<ServerAuthToken> refreshAuthToken(
    SocialAuthProviderBase provider,
  ) async {
    _authToken = await _server.refresh(_authToken);
    return _authToken;
  }
}
