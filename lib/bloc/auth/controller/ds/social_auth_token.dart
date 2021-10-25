import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_auth_token.freezed.dart';
part 'social_auth_token.g.dart';

@freezed
class SocialAuthToken with _$SocialAuthToken {
  factory SocialAuthToken.kakao({
    required String accessToken,
  }) = KakaoAccessToken;

  factory SocialAuthToken.apple({
    required String accessToken,
  }) = AppleAccessToken;

  factory SocialAuthToken.failed() = FailedSocialAuthToken;
  factory SocialAuthToken.fromJson(Map<String, dynamic> json) =>
      _$SocialAuthTokenFromJson(json);
}
