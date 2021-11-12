import 'package:bodymood/bloc/auth/controller/auth_token_manager_provider.dart';
import 'package:bodymood/bloc/editor/api/emotion_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/emotion.dart';

final emotionsProvider = FutureProvider<List<BodymoodEmotion>>(
  (ref) async {
    final tokenManager = ref.watch(authTokenManagerProvider);
    final api = BodymoodEmotionCategoryApi(tokenManager: tokenManager);
    final emotions = await api.get();
    return emotions;
  },
);
