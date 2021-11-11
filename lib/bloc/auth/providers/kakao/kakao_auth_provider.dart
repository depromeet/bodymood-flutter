import 'package:flutter/foundation.dart';
import 'package:kakao_flutter_sdk/all.dart';

import '../../controller/ds/social_auth_token.dart';
import '../../controller/inteface/social_auth_provider.dart';

class KakaoAuthProvider extends SocialAuthProviderBase {
  @override
  Future<SocialAuthToken> getToken() async {
    KakaoContext.clientId = '1f1d9175f9c1e2682cf32d234475f94a';
    OAuthToken? result;
    try {
      final isKakaoInstalled = await isKakaoTalkInstalled();
      if (isKakaoInstalled) {
        result = await UserApi.instance.loginWithKakaoTalk();
      } else {
        result = await UserApi.instance.loginWithKakaoAccount();
      }
    } catch (e) {
      debugPrint('error on kakao login: $e');
    }
    if (result != null) {
      return SocialAuthToken.kakao(accessToken: result.accessToken!);
    }
    return SocialAuthToken.failed();
  }

  @override
  Future<SocialAuthToken> refreshToken() {
    throw UnimplementedError();
  }
}
