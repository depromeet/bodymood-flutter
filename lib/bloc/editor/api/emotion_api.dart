import 'package:bodymood/bloc/editor/api/model/emotion_api/emotion_data.dart';
import 'package:bodymood/bloc/editor/api/model/emotion_api/emotion_response.dart';
import 'package:bodymood/bloc/editor/model/emotion.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../auth/controller/auth_token_manager.dart';
import '../base/remote_data_getter.dart';

class BodymoodEmotionCategoryApi
    extends RemoteDataGetter<List<BodymoodEmotion>> {
  BodymoodEmotionCategoryApi({
    required this.tokenManager,
  });
  final BodymoodAuthTokenManager tokenManager;
  static const _endpoint = 'https://dev.bodymood.me/api/v1/emotions/categories';
  final Dio _dio = Dio();

  @override
  Future<List<BodymoodEmotion>> get() async {
    final response = await _dio
        .get<Map<String, dynamic>>(
      _endpoint,
      options: Options(
        responseType: ResponseType.json,
      ),
    )
        .catchError(
      (e) {
        debugPrint('Error on exericse category api $e');
      },
    );
    final exerciseResponse = EmotionApiResponse.fromJson(response.data!);
    final data = exerciseResponse.data;
    final ret = <BodymoodEmotion>[];
    for (final emotion in data) {
      ret.add(await _emotionResponseDataToEmotionModel(emotion));
    }
    return ret;
  }

  Future<BodymoodEmotion> _emotionResponseDataToEmotionModel(
    EmotionApiData data,
  ) async {
    return BodymoodEmotion(
      startColor: data.startColor,
      endColor: data.endColor,
      englishTitle: data.englishTitle,
      koreanTitle: data.koreanTitle,
      fontColor: data.fontColor,
    );
  }
}