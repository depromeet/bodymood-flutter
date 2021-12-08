import 'package:flutter/foundation.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/user.dart';

import '../../controller/ds/social_auth_token.dart';
import '../../controller/inteface/social_auth_provider.dart';

class KakaoAuthRefresher extends SocialAuthProviderBase {
  @override
  Future<SocialAuthToken> getToken() async {
    KakaoContext.clientId = '1f1d9175f9c1e2682cf32d234475f94a';
    OAuthToken? result;
    try {
      final hasToken = await AuthApi.instance.hasToken();
      if (hasToken) {
        result = await TokenManager.instance.getToken();
        result =
            await AuthApi.instance.refreshAccessToken(result.refreshToken!);
      }
    } catch (e) {
      debugPrint('error on kakao refresher: $e');
    }
    if (result != null) {
      return SocialAuthToken.kakao(
        accessToken: result.accessToken!,
        refreshToken: result.refreshToken!,
      );
    }
    return SocialAuthToken.failed();
  }

  @override
  Future<SocialAuthToken> refreshToken() {
    throw UnimplementedError();
  }

  @override
  Future reset() {
    throw UnimplementedError();
  }
}
