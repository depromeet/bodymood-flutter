import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../common/api_server.dart';
import '../controller/ds/auth_token.dart';
import '../controller/ds/social_auth_token.dart';
import '../controller/inteface/server_auth_provider.dart';
import 'ds/auth_response.dart';

class BodymoodAuthServer extends ServerAuthProviderBase {
  final _dio = Dio();
  final _authEndpoint = '$bodymoodEndpoint/api/v1/auth/';
  @override
  Future<ServerAuthToken> login(SocialAuthToken socialToken) async {
    final response = await socialToken.maybeMap(
      kakao: (token) async {
        final endpoint = _authEndpoint + '/kakao';
        final tokenBody = socialToken.toJson();
        tokenBody.removeWhere((key, value) => key != 'accessToken');

        return _dio
            .post<Map<String, dynamic>>(
          endpoint,
          data: tokenBody,
          options: Options(
            contentType: 'application/json',
            responseType: ResponseType.json,
          ),
        )
            .catchError(
          (error, stackTrace) async {
            debugPrint(error.toString());
          },
        );
      },
      apple: (_) {
        throw UnimplementedError();
      },
      orElse: () {
        debugPrint('not loggedin');
      },
    );

    if (response?.statusCode == 200) {
      final serverAuthResponse =
          SuccessfulServerAuthResponse.fromJson(response!.data!);
      return serverAuthResponse.token;
    }
    return const ServerAuthToken.unauthorizedToken();
  }

  @override
  Future<bool> logout() async {
    return true;
  }

  @override
  Future<ServerAuthToken> refresh(ServerAuthToken token) {
    throw UnimplementedError();
  }

  @override
  Future<bool> signout(ServerAuthToken token) async {
    final _authEndpoint = '$bodymoodEndpoint/api/v1/user/me';
    final accessToken = (token as ServerAuthTokenAuthorized).accessToken;
    await _dio.delete(
      _authEndpoint,
      options: Options(
        headers: {'Authrization': accessToken},
      ),
    );

    return true;
  }
}
