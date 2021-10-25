import 'package:bodymood/bloc/auth/controller/ds/auth_token.dart';
import 'package:bodymood/bloc/auth/controller/ds/social_auth_token.dart';
import 'package:bodymood/bloc/auth/controller/inteface/server_auth_provider.dart';
import 'package:bodymood/bloc/auth/server/ds/auth_response.dart';
import 'package:dio/dio.dart';

class BodyMoodAuthServer extends ServerAuthProviderBase {
  final _dio = Dio();
  final _authEndpoint = 'https://dev.bodymood.me/api/v1/auth/';
  @override
  Future<AuthToken> login(SocialAuthToken socialToken) async {
    final response = await socialToken.maybeMap(
      kakao: (token) async {
        final endpoint = _authEndpoint + '/kakao';
        return _dio.post<Map<String, dynamic>>(
          endpoint,
          data: socialToken.toJson(),
          options: Options(
            contentType: 'application/json',
            responseType: ResponseType.json,
          ),
        );
      },
      apple: (_) {
        final endpoint = _authEndpoint + '/apple';
        throw UnimplementedError();
      },
      orElse: () {
        throw UnimplementedError();
      },
    );

    if (response.statusCode == 200) {
      final serverAuthResponse =
          SuccessfulServerAuthResponse.fromJson(response.data!);
      return serverAuthResponse.token;
    }
    return const UnauthorizedToken();
  }

  @override
  Future<bool> logout() {
    throw UnimplementedError();
  }

  @override
  Future<AuthToken> refresh(AuthToken token) {
    throw UnimplementedError();
  }
}
