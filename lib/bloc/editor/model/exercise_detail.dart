import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_detail.g.dart';

@JsonSerializable()
class ExerciseDetail with EquatableMixin {
  const ExerciseDetail({
    required this.englishTitle,
    required this.koreanTitle,
  });
  final String koreanTitle;
  final String englishTitle;
  factory ExerciseDetail.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseDetailToJson(this);

  @override
  List<Object?> get props => [
        englishTitle,
        koreanTitle,
      ];
}
