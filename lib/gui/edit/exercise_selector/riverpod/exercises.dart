import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/exercise_category.dart';
import '../models/exercise_detail.dart';

final exercisesProvider = FutureProvider<List<ExerciseCategory>>(
  (_) {
    return Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
      () => const [
        ExerciseCategory(
          engilshTitle: 'Shoulder',
          koreanTitle: '어깨',
          details: [
            ExerciseDetail(
              englishTitle: 'This',
              koreanTitle: '이것',
            ),
          ],
        ),
        ExerciseCategory(
          engilshTitle: 'Shoulder',
          koreanTitle: '어깨',
          details: [
            ExerciseDetail(
              englishTitle: 'This',
              koreanTitle: '이것',
            ),
          ],
        ),
        ExerciseCategory(
          engilshTitle: 'Shoulder',
          koreanTitle: '어깨',
          details: [
            ExerciseDetail(
              englishTitle: 'This',
              koreanTitle: '이것',
            ),
          ],
        ),
        ExerciseCategory(
          engilshTitle: 'Cheset',
          koreanTitle: '가슴 운동',
          details: [
            ExerciseDetail(
              englishTitle: 'This',
              koreanTitle: '이것',
            ),
          ],
        ),
        ExerciseCategory(
          engilshTitle: 'Back',
          koreanTitle: '등, 허리',
          details: [
            ExerciseDetail(
              englishTitle: 'This',
              koreanTitle: '이것',
            ),
          ],
        ),
      ],
    );
  },
);
