import 'package:freezed_annotation/freezed_annotation.dart';

import '../../controller/ds/auth_token.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class ServerAuthResponse with _$ServerAuthResponse {
  factory ServerAuthResponse.success({
    required String code,
    required String message,
    @JsonKey(name: 'data') required AuthorizedToken token,
  }) = SuccessfulServerAuthResponse;
  factory ServerAuthResponse.fail() = FailedServerAuthResponse;

  factory ServerAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerAuthResponseFromJson(json);
}
