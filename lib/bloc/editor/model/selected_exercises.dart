import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise_detail.dart';

part 'selected_exercises.g.dart';

@JsonSerializable()
class SelectedExercise with EquatableMixin {
  final ExerciseDetail detail;

  SelectedExercise({
    required this.detail,
  });

  factory SelectedExercise.fromJson(Map<String, dynamic> json) =>
      _$SelectedExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$SelectedExerciseToJson(this);

  @override
  List<Object?> get props => [detail];
}
