import 'emotion.dart';

import 'exercise_detail.dart';

class PosterDetail {
  final String posterImagePath;
  final String originalImagePath;
  final BodymoodEmotion emotion;
  final List<ExerciseDetail> exercises;

  PosterDetail({
    required this.posterImagePath,
    required this.originalImagePath,
    required this.emotion,
    required this.exercises,
  });
}
