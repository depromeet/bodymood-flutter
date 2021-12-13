import 'package:flutter/material.dart';

import '../../bloc/editor/model/emotion.dart';
import '../../bloc/editor/model/exercise_detail.dart';
import '../../bloc/editor/model/selected_emotion.dart';
import '../../bloc/posters/core/ds/poster_store.dart';
import '../../gui/create/model/predefined_template.dart';
import '../../state/editor_view/editor_view_poster_state.dart';

class EditorViewPosterInteractor extends ChangeNotifier {
  EditorViewPosterState state = EditorViewPosterState.empty();

  void updateImage(ImageStore image) {
    state = state.map(empty: (empty) {
      return EditorViewPosterState.filled(image: image);
    }, filled: (filled) {
      return filled.copyWith(
        image: image,
      );
    });
    notifyListeners();
  }

  void addExercise(ExerciseDetail exercise) {
    state = state.map(
      empty: (empty) {
        return EditorViewPosterState.filled(
          exercises: [exercise],
        );
      },
      filled: (filled) {
        final isInList = filled.exercises.contains(exercise);
        assert(!isInList);
        if (filled.exercises.length < filled.maxNumOfExercises) {
          filled = filled.copyWith(exercises: [
            ...filled.exercises,
            exercise,
          ]);
        }
        return filled;
      },
    );
    notifyListeners();
  }

  void removeExercise(ExerciseDetail exercise) {
    state = state.maybeMap(
      orElse: () => state,
      filled: (filled) {
        final isInList = filled.exercises.contains(exercise);
        assert(isInList);
        filled.exercises.remove(exercise);
        return filled;
      },
    );
    notifyListeners();
  }

  void updateMood(BodymoodEmotion mood) {
    state = state.map(
      empty: (empty) {
        return EditorViewPosterState.filled(
          mood: SelectedMood.selected(mood),
        );
      },
      filled: (filled) {
        return filled.copyWith(
          mood: SelectedMood.selected(mood),
        );
      },
    );
    notifyListeners();
  }

  void setTemplate(int index) {
    state = state.map(
      empty: (empty) {
        return EditorViewPosterState.filled(
          templateIndex: index,
          maxNumOfExercises: predefinedTemplate[index].maxNumOfExercises,
        );
      },
      filled: (filled) {
        return filled.copyWith(
          templateIndex: index,
          maxNumOfExercises: predefinedTemplate[index].maxNumOfExercises,
        );
      },
    );
    notifyListeners();
  }

  bool get isImageSelected => state.maybeMap(
        filled: (filled) => filled.image.maybeMap(
          empty: (_) => false,
          orElse: () => true,
        ),
        orElse: () => false,
      );
  bool get isExerciseSelected => state.maybeMap(
        filled: (filled) => filled.exercises.isNotEmpty,
        orElse: () => false,
      );
  bool get isMoodSelected => state.maybeMap(
        filled: (filled) => filled.mood.map(
          selected: (_) => true,
          empty: (_) => false,
        ),
        orElse: () => false,
      );
  bool get isCompleted =>
      isImageSelected && isExerciseSelected && isMoodSelected;

  int get templateIndex => state.maybeMap(
        filled: (_state) => _state.templateIndex,
        orElse: () => 0,
      );
}
