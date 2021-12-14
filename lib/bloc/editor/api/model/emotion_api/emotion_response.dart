import 'package:freezed_annotation/freezed_annotation.dart';

import 'emotion_data.dart';

part 'emotion_response.g.dart';

@JsonSerializable()
class EmotionApiResponse {
  EmotionApiResponse({
    required this.code,
    required this.message,
    required this.data,
  });
  final String code;
  final String message;
  final List<EmotionApiData> data;

  factory EmotionApiResponse.fromJson(Map<String, dynamic> json) =>
      _$EmotionApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmotionApiResponseToJson(this);
}
