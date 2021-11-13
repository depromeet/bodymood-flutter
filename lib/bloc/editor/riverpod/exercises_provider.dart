import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controller/auth_token_manager_provider.dart';
import '../api/exercise_category_api.dart';
import '../model/exercise_category.dart';

typedef ExerciseList = List<ExerciseCategory>;
final exercisesProvider = FutureProvider<ExerciseList>(
  (ref) async {
    final tokenManager = ref.watch(authTokenManagerProvider);
    final api = BodymoodExerciseCategoryApi(tokenManager: tokenManager);
    final data = await api.get();
    return data;
  },
);
