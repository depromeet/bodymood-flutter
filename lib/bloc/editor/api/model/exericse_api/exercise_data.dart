import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_data.g.dart';

@JsonSerializable()
class ExerciseApiResponseData {
  ExerciseApiResponseData({
    required this.categoryId,
    required this.depth,
    required this.englishName,
    required this.koreanName,
    this.children = const [],
  });
  final int categoryId;
  final int depth;
  final String englishName;
  final String koreanName;
  final List<ExerciseApiResponseData> children;

  factory ExerciseApiResponseData.fromJson(Map<String, dynamic> json) =>
      _$ExerciseApiResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseApiResponseDataToJson(this);
}
