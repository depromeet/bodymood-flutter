import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_type.freezed.dart';

@freezed
class SocialType with _$SocialType {
  const factory SocialType.kakao() = KakaoAuthType;
  const factory SocialType.apple() = AppleAuthType;
}
