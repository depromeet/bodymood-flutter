import 'package:dio/dio.dart';

import '../../../common/api_server.dart';
import '../../auth/controller/auth_token_manager.dart';
import '../../auth/controller/ds/auth_token.dart';
import '../model/poster_image.dart';
import 'model/fetch_result.dart';

class BodymoodPosterFetchApi {
  BodymoodPosterFetchApi({
    required this.tokenManager,
    this.fetchCount = 20,
  });
  final BodymoodAuthTokenManager tokenManager;
  final int fetchCount;
  int currentPage = 0;

  final _endpoint = '$bodymoodEndpoint/api/v1/posters';
  final _dio = Dio();

  Future<List<PosterImage>> refresh() async {
    currentPage = 0;
    return getNext();
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
            id: e.photoId,
            imageUrl: e.imageUrl,
            createdAt: DateTime.parse(e.createdAt),
          ),
        )
        .toList();
  }
}
