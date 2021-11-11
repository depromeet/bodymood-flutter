import '../../../bloc/posters/core/ds/emotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_emotion.freezed.dart';
part 'selected_emotion.g.dart';

@freezed
class SelectedEmotion with _$SelectedEmotion {
  factory SelectedEmotion.empty() = EmotionNotSelected;
  factory SelectedEmotion.selected(BodymoodEmotion emotion) = EmotionSelected;

  factory SelectedEmotion.fromJson(Map<String, dynamic> json) =>
      _$SelectedEmotionFromJson(json);
}
