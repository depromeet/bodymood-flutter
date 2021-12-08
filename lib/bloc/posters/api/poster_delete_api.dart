import 'package:dio/dio.dart';

import '../../../common/api_server.dart';

class BodymoodPosterDeleteApi {
  BodymoodPosterDeleteApi({
    required this.accessToken,
  });
  final String accessToken;

  final _endpoint = '$bodymoodEndpoint/api/v1/posters';
  final _dio = Dio();

  delete(int posterId) async {
    final options = Options(
      contentType: 'application/json',
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      validateStatus: (status) => status! < 500,
    );
    await _dio.delete<Map<String, dynamic>>(
      _endpoint + '/$posterId',
      options: options,
    );
  }
}
