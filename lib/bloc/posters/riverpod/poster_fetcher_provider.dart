import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controller/auth_token_manager_provider.dart';
import '../api/poster_fetch_api.dart';

final posterFetcherProvider = Provider((ref) {
  final tokenManager = ref.watch(authTokenManagerProvider);
  return BodymoodPosterFetchApi(tokenManager: tokenManager);
});
