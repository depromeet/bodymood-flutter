import 'dart:io';

import 'package:bodymood/bloc/auth/controller/auth_token_manager.dart';
import 'package:bodymood/bloc/auth/controller/ds/auth_token.dart';
import 'package:bodymood/bloc/editor/model/poster_detail.dart';
import 'package:bodymood/common/api_server.dart';
import 'package:flutter/material.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';

class BodymoodPosterCreationApi {
  BodymoodPosterCreationApi(this.tokenManager);
  final BodymoodAuthTokenManager tokenManager;
  final _dio = Dio();
  final _endpoint = '$bodymoodEndpoint/api/v1/posters';

  Future<bool> create(PosterDetail detail) async {
    final originalImagePath = detail.originalImagePath;
    final posterImagePath = detail.posterImagePath;
    final categories = detail.exercises.map((e) => e.detailId).toList();
    final emotion = detail.emotion.englishTitle.toUpperCase();

    final token = tokenManager.authToken as ServerAuthTokenAuthorized;
    final originalMimee =
        mime(originalImagePath)?.split('/') ?? ['image', 'png'];
    final posterMimee = mime(posterImagePath)?.split('/') ?? ['image', 'png'];

    final formData = FormData.fromMap(
      {
        'emotion': emotion,
        'categories': categories,
        'posterImage': await MultipartFile.fromFile(
          posterImagePath,
          contentType: MediaType(posterMimee[0], posterMimee[1]),
        ),
        'originImage': await MultipartFile.fromFile(
          originalImagePath,
          contentType: MediaType(originalMimee[0], originalMimee[1]),
        ),
      },
    );
    final options = Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ${token.accessToken}',
        },
        receiveDataWhenStatusError: true,
        contentType: ContentType.parse('multipart/form-data').value,
        validateStatus: (status) {
          return (status ?? 200) < 500;
        });
    try {
      await _dio.post(
        _endpoint,
        options: options,
        data: formData,
      );
    } catch (e) {
      debugPrint('dio error: $e');
    }

    return true;
  }
}
