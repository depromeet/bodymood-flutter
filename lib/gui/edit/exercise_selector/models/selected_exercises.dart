import 'exercise_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_exercises.g.dart';

@JsonSerializable()
class SelectedExercise with EquatableMixin {
  final ExerciseDetail detail;
  final int categoryNum;
  final int detailNum;

  SelectedExercise({
    required this.detail,
    required this.categoryNum,
    required this.detailNum,
  });

  factory SelectedExercise.fromJson(Map<String, dynamic> json) =>
      _$SelectedExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$SelectedExerciseToJson(this);

  @override
  List<Object?> get props => [detail, categoryNum, detailNum];
}
