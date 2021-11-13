import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

@freezed
class ServerAuthToken with _$ServerAuthToken {
  const factory ServerAuthToken.authorizedToken(
      String accessToken, String refreshToken) = ServerAuthTokenAuthorized;
  const factory ServerAuthToken.unauthorizedToken() =
      ServerAuthTokenUnauthorized;
  factory ServerAuthToken.fromJson(Map<String, dynamic> json) =>
      _$ServerAuthTokenFromJson(json);
}
