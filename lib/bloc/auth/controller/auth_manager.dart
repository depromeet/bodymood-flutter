import 'package:bodymood/bloc/auth/controller/ds/auth_token.dart';
import 'package:bodymood/bloc/auth/controller/inteface/social_auth_provider.dart';
import 'package:bodymood/bloc/auth/controller/inteface/server_auth_provider.dart';

class AuthManager {
  AuthManager({
    required ServerAuthProviderBase server,
  }) : _server = server;

  final ServerAuthProviderBase _server;

  AuthToken get authToken => _authToken;
  AuthToken _authToken = const UnauthorizedToken();

  Future<AuthToken> updateAuthToken(SocialAuthProviderBase provider) async {
    final socialToken = await provider.getToken();
    _authToken = await _server.login(socialToken);
    return _authToken;
  }

  Future<bool> resetAuthToken() async {
    final didReset = await _server.logout();
    if (didReset) {
      _authToken = const UnauthorizedToken();
    }
    return didReset;
  }

  Future<AuthToken> refreshAuthToken(SocialAuthProviderBase provider) async {
    _authToken = await _server.refresh(_authToken);
    return _authToken;
  }
}
