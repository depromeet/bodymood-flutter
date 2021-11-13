import 'package:freezed_annotation/freezed_annotation.dart';

part 'emotion_data.g.dart';

@JsonSerializable()
class EmotionApiData {
  EmotionApiData({
    required this.type,
    required this.englishTitle,
    required this.koreanTitle,
    required this.startColor,
    required this.endColor,
    required this.fontColor,
  });
  final String type;
  final String englishTitle;
  final String koreanTitle;
  final String startColor;
  final String endColor;
  final String fontColor;

  factory EmotionApiData.fromJson(Map<String, dynamic> json) =>
      _$EmotionApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmotionApiDataToJson(this);
}
