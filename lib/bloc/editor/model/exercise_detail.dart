import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_detail.g.dart';

@JsonSerializable()
class ExerciseDetail with EquatableMixin {
  const ExerciseDetail({
    required this.englishName,
    required this.koreanName,
    required this.categoryId,
    required this.detailId,
  });
  final String koreanName;
  final String englishName;
  final int categoryId;
  final int detailId;
  factory ExerciseDetail.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseDetailToJson(this);

  @override
  List<Object?> get props => [
        englishName,
        koreanName,
      ];
}
