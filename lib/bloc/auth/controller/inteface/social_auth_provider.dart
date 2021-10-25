import 'package:bodymood/bloc/auth/controller/ds/social_auth_token.dart';

abstract class SocialAuthProviderBase {
  Future<SocialAuthToken> getToken();
  Future<SocialAuthToken> refreshToken();
}
