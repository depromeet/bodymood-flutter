import '../model/selected_exercises.dart';
import 'selected_exercise_provider.dart';
import 'selected_photo_provider.dart';
import '../../posters/core/ds/poster_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/selected_emotion.dart';
import 'selected_emotion_provider.dart';

final editorStateProvider = StateProvider<EditorState>(
  (ref) => EditorState(
    reader: ref.read,
  ),
);

class EditorState {
  EditorState({
    required Reader reader,
  }) : _read = reader;

  final Reader _read;

  SelectedEmotion get emotion => _read(selectedEmotionProvider).emotion;
  List<SelectedExercise> get exercises =>
      _read(selectedExerciseProvider).exercises;
  ImageStore get image => _read(selectedImageProvider).image;
}
