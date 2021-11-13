import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_being_selected.freezed.dart';

@freezed
class ItemBeingSelected with _$ItemBeingSelected {
  factory ItemBeingSelected.image() = ImageBeingSelected;
  factory ItemBeingSelected.exercises() = ExercisesBeingSelected;
  factory ItemBeingSelected.emotion() = EmotionBeingSelected;
  factory ItemBeingSelected.none() = NothingBeingSelected;
}
