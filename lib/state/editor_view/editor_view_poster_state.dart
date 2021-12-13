import 'package:freezed_annotation/freezed_annotation.dart';

import '../../bloc/editor/model/exercise_detail.dart';
import '../../bloc/editor/model/selected_emotion.dart';
import '../../bloc/posters/core/ds/poster_store.dart';

part 'editor_view_poster_state.freezed.dart';

@freezed
class EditorViewPosterState with _$EditorViewPosterState {
  const EditorViewPosterState._();
  factory EditorViewPosterState.empty() = _EmptyPoster;
  factory EditorViewPosterState.filled({
    @Default(SelectedMood.empty()) SelectedMood mood,
    @Default([]) List<ExerciseDetail> exercises,
    @Default(ImageStore.empty()) ImageStore image,
    @Default(0) int templateIndex,
  }) = _FilledPoster;
}
