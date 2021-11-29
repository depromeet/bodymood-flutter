import '../../../common/api_server.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../auth/controller/auth_token_manager.dart';
import '../base/remote_data_getter.dart';
import '../model/exercise_category.dart';
import '../model/exercise_detail.dart';
import 'model/exericse_api/exercise_data.dart';
import 'model/exericse_api/response.dart';

class BodymoodExerciseCategoryApi
    extends RemoteDataGetter<List<ExerciseCategory>> {
  BodymoodExerciseCategoryApi({
    required this.tokenManager,
  });
  final BodymoodAuthTokenManager tokenManager;
  static const _endpoint = '${bodymoodEndpoint}/api/v1/exercises/categories';
  final Dio _dio = Dio();

  @override
  Future<List<ExerciseCategory>> get() async {
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
    final exerciseResponse = ExerciseApiResponse.fromJson(response.data!);
    final data = exerciseResponse.data;
    final ret = <ExerciseCategory>[];
    for (final ex in data) {
      ret.add(await _exerciseResponseDataToExerciseCategory(ex));
    }
    return ret;
  }

  Future<ExerciseCategory> _exerciseResponseDataToExerciseCategory(
    ExerciseApiResponseData data,
  ) async {
    final details = data.children.map(
      (e) {
        return ExerciseDetail(
          categoryId: data.categoryId,
          detailId: e.categoryId,
          englishName: e.englishName,
          koreanName: e.koreanName,
        );
      },
    ).toList();

    return ExerciseCategory(
      englishName: data.englishName,
      koreanName: data.koreanName,
      details: details,
    );
  }
}
