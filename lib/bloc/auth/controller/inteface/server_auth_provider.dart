import '../ds/auth_token.dart';
import '../ds/social_auth_token.dart';

abstract class ServerAuthProviderBase {
  Future<AuthToken> login(SocialAuthToken socialToken);
  Future<bool> logout();
  Future<AuthToken> refresh(AuthToken token);
}
