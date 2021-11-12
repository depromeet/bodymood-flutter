import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise_data.dart';

part 'response.g.dart';

@JsonSerializable()
class ExerciseApiResponse {
  ExerciseApiResponse({
    required this.code,
    required this.message,
    this.data = const [],
  });
  final String code;
  final String message;
  final List<ExerciseApiResponseData> data;
  factory ExerciseApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ExerciseApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseApiResponseToJson(this);
}
