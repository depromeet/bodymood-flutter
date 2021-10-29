import '../../controller/ds/social_auth_token.dart';
import '../../controller/inteface/social_auth_provider.dart';

class AppleAuthProvider extends SocialAuthProviderBase {
  @override
  Future<SocialAuthToken> getToken() {
    throw UnimplementedError();
  }

  @override
  Future<SocialAuthToken> refreshToken() {
    throw UnimplementedError();
  }
}
