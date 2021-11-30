import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/editor/model/emotion.dart';
import '../../bloc/editor/model/exercise_detail.dart';
import '../../bloc/editor/model/selected_emotion.dart';
import '../../bloc/posters/core/ds/poster_store.dart';
import '../../interactor/app_view/editor_view_poster_interactor.dart';

final editorViewPosterEncloser =
    ChangeNotifierProvider.autoDispose((ref) => EditorViewPosterEncloser());

class EditorViewPosterEncloser extends EditorViewPosterInteractor {
  bool containsExercise(ExerciseDetail exercise) {
    return state.map(
      empty: (_) => false,
      filled: (filled) => filled.exercises.contains(exercise),
    );
  }

  bool containsMood(BodymoodEmotion mood) {
    return state.map(
      empty: (_) => false,
      filled: (filled) => filled.mood.map(
        empty: (_) => false,
        selected: (selected) => selected.emotion == mood,
      ),
    );
  }

  ImageProvider? get imageProvider => state.map(
        empty: (_) => null,
        filled: (filled) {
          return filled.image.map(
            local: (image) => AssetImage(image.path),
            remote: (image) => CachedNetworkImageProvider(image.path),
            empty: (_) => null,
          );
        },
      );

  ImageStore get image => state.map(
        empty: (_) => const ImageStore.empty(),
        filled: (filled) => filled.image,
      );

  List<ExerciseDetail> get exercises => state.map(
        empty: (_) => [],
        filled: (filled) => filled.exercises,
      );
  SelectedMood get mood => state.map(
        empty: (_) => const SelectedMood.empty(),
        filled: (filled) => filled.mood,
      );
}
