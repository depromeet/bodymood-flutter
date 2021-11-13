import 'package:freezed_annotation/freezed_annotation.dart';

part 'emotion.g.dart';

@JsonSerializable()
class BodymoodEmotion {
  final String startColor;
  final String endColor;
  final String englishTitle;
  final String koreanTitle;
  final String fontColor;

  BodymoodEmotion({
    required this.startColor,
    required this.endColor,
    required this.englishTitle,
    required this.koreanTitle,
    required this.fontColor,
  });

  factory BodymoodEmotion.fromJson(Map<String, dynamic> json) =>
      _$BodymoodEmotionFromJson(json);
  Map<String, dynamic> toJson() => _$BodymoodEmotionToJson(this);
}
