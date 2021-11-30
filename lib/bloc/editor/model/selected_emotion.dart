import 'package:freezed_annotation/freezed_annotation.dart';

import 'emotion.dart';

part 'selected_emotion.freezed.dart';
part 'selected_emotion.g.dart';

@freezed
class SelectedMood with _$SelectedMood {
  const factory SelectedMood.empty() = EmotionNotSelected;
  factory SelectedMood.selected(BodymoodEmotion emotion) = EmotionSelected;

  factory SelectedMood.fromJson(Map<String, dynamic> json) =>
      _$SelectedMoodFromJson(json);
}
