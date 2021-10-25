import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

@freezed
class AuthToken with _$AuthToken {
  const factory AuthToken.authorizedToken(
      String accessToken, String refreshToken) = AuthorizedToken;
  const factory AuthToken.unauthorizedToken() = UnauthorizedToken;
  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
}
