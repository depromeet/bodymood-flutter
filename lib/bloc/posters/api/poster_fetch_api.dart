import 'package:bodymood/bloc/auth/controller/auth_token_manager.dart';
import 'package:bodymood/bloc/auth/controller/ds/auth_token.dart';
import 'package:bodymood/bloc/posters/api/model/fetch_result.dart';
import 'package:bodymood/bloc/posters/model/poster_image.dart';
import 'package:dio/dio.dart';

class BodymoodPosterFetchApi {
  BodymoodPosterFetchApi({
    required this.tokenManager,
    this.fetchCount = 20,
  });
  final BodymoodAuthTokenManager tokenManager;
  final int fetchCount;
  int currentPage = 0;

  final _endpoint = 'https://dev.bodymood.me/api/v1/posters';
  final _dio = Dio();

  Future<List<PosterImage>> refresh() async {
    currentPage = 0;
    return _getPosters();
  }

  Future<List<PosterImage>> getNext() async {
    final posters = _getPosters();
    currentPage++;
    return posters;
  }

  Future<List<PosterImage>> _getPosters() async {
    final token =
        (tokenManager.authToken as ServerAuthTokenAuthorized).accessToken;
    final options = Options(
      contentType: 'application/json',
      headers: {
        'Authorization': 'Bearer $token',
      },
      validateStatus: (status) => status! < 500,
    );
    final result = await _dio.get<Map<String, dynamic>>(
        _endpoint + '?page=$currentPage&size=$fetchCount',
        options: options);
    final response = FetchedResult.fromJson(result.data!);
    return response.data.posters
        .map(
          (e) => PosterImage(
            imageUrl: e.imageUrl,
            createdAt: DateTime.parse(e.createdAt),
          ),
        )
        .toList();
  }
}
