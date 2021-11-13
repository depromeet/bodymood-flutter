import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise_detail.dart';

part 'exercise_category.g.dart';

@JsonSerializable()
class ExerciseCategory {
  const ExerciseCategory({
    required this.englishName,
    required this.koreanName,
    this.details = const [],
  });
  final String koreanName;
  final String englishName;
  final List<ExerciseDetail> details;

  factory ExerciseCategory.fromJson(Map<String, dynamic> json) =>
      _$ExerciseCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseCategoryToJson(this);
}
