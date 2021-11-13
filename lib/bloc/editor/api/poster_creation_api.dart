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
  final _endpoint = '${bodymoodEndpoint}/api/v1/posters';

  Future<bool> create(PosterDetail detail) async {
    final originalImagePath = detail.originalImagePath;
    final posterImagepath = detail.posterImagePath;
    final categories = detail.exercises.map((e) => e.detailId).toList();
    final emotion = detail.emotion.englishTitle.toUpperCase();

    final token = tokenManager.authToken as ServerAuthTokenAuthorized;
    final originalMimee =
        mime(originalImagePath)?.split('/') ?? ['image', 'png'];
    final posterMimee = mime(posterImagepath)?.split('/') ?? ['image', 'png'];
    debugPrint('originalMimmeee: ${originalMimee}');
    debugPrint('poster Mime: ${posterMimee}');
    final formData = FormData.fromMap(
      {
        'emotion': emotion,
        'categories': categories,
        'posterImage': await MultipartFile.fromFile(
          posterImagepath,
          contentType: MediaType(posterImagepath[0], posterImagepath[1]),
        ),
        'originImage': await MultipartFile.fromFile(
          originalImagePath,
          contentType: MediaType(originalMimee[0], originalMimee[1]),
        ),
      },
    );
    debugPrint('accessToken: ${token.accessToken}');
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
      final result = await _dio.post(
        _endpoint,
        options: options,
        data: formData,
      );
      debugPrint('post poster result: ${result.data}');
    } catch (e) {
      debugPrint('dio error: $e');
    }

    return true;
  }
}
