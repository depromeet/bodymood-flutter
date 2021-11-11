import '../exercise_selector/models/selected_exercises.dart';
import 'seletable_item_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedExerciseProvider = ChangeNotifierProvider<ExerciseNotifier>(
  (_) => ExerciseNotifier(),
);

class ExerciseNotifier extends PosterItemsNotifier {
  ExerciseNotifier() : super();

  var _exercises = <SelectedExercise>[];
  List<SelectedExercise> get exercises => List.unmodifiable(_exercises);

  replaceList(List<SelectedExercise> ex) {
    _exercises = ex;
    notifyListeners();
  }

  updateList(SelectedExercise ex) {
    final included = _exercises.any((item) => item == ex);
    if (included) {
      _removeExercise(ex);
    } else {
      _addExercise(ex);
    }
    notifyListeners();
  }

  _removeExercise(SelectedExercise ex) {
    _exercises.remove(ex);
    notifyListeners();
  }

  _addExercise(SelectedExercise ex) {
    if (exercises.length < 3) {
      _exercises.add(ex);
      notifyListeners();
    }
  }

  @override
  reset([bool shouldNotifyListeners = false]) {
    _exercises.clear();
    if (shouldNotifyListeners) {
      notifyListeners();
    }
  }

  @override
  bool get selected => exercises.isNotEmpty;
}
