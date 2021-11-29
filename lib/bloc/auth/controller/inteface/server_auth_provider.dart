import '../ds/auth_token.dart';
import '../ds/social_auth_token.dart';

abstract class ServerAuthProviderBase {
  Future<ServerAuthToken> login(SocialAuthToken socialToken);
  Future<bool> logout();
  Future<ServerAuthToken> refresh(ServerAuthToken token);
  Future<bool> signout(ServerAuthToken token);
}
