import 'package:bodymood/bloc/auth/controller/auth_token_manager_provider.dart';
import 'package:bodymood/bloc/posters/api/poster_fetch_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final posterFetcherProvider = Provider((ref) {
  final tokenManager = ref.watch(authTokenManagerProvider);
  return BodymoodPosterFetchApi(tokenManager: tokenManager);
});
