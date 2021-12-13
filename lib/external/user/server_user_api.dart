import 'package:dio/dio.dart';

import '../../../common/api_server.dart';
import '../../bloc/user/interface/user_api_interface.dart';
import '../../bloc/user/model/user.dart';

class ServerUserApi implements UserApiInterface {
  final _dio = Dio();
  final String _accessToken;
  final _endpoint = '$bodymoodEndpoint/api/v1/user/me';

  ServerUserApi(this._accessToken);

  @override
  Future<BodymoodUser> user() async {
    final result = await _dio.get(
      _endpoint,
      options: Options(
        headers: {'Authorization': 'Bearer $_accessToken'},
      ),
    );
    if (result.statusCode == 200) {
      return BodymoodUser.fromJson(result.data['data']);
    }
    return BodymoodUser('', '');
  }
}
