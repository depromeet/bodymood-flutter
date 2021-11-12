import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/editor/riverpod/emotion_provider.dart';
import '../../../bloc/editor/riverpod/exercise_provider.dart';
import '../../../bloc/editor/riverpod/photo_provider.dart';
import '../../../bloc/editor/riverpod/seletable_item_notifier.dart';

final _deps = <ChangeNotifierProvider<PosterItemsNotifier>>[
  selectedPhotoProvider,
  selectedExerciseProvider,
  selectedEmotionProvider,
];

final posterItemsProvider = StateNotifierProvider(
  (ref) {
    for (final dep in _deps) {
      ref.watch(dep);
    }
    return PosterChangeStatusNotifier(
      read: ref.read,
    );
  },
);

class PosterChangeStatusNotifier extends StateNotifier {
  PosterChangeStatusNotifier({required Reader read, state})
      : _read = read,
        super(state);

  final Reader _read;

  bool get selectedAll => _deps.fold<bool>(true,
      (selected, provider) => selected && _read(provider.notifier).selected);

  bool get selectedPartial => _deps.fold<bool>(false,
      (selected, provider) => selected || _read(provider.notifier).selected);

  void reset() {
    for (final dep in _deps) {
      _read(dep).reset(false);
    }
  }
}
