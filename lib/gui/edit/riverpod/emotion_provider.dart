import '../../../bloc/posters/core/ds/emotion.dart';
import '../models/selected_emotion.dart';
import 'seletable_item_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedEmotionProvider = ChangeNotifierProvider<EmotionNotifier>(
  (_) => EmotionNotifier(EmotionNotSelected()),
);

class EmotionNotifier extends PosterItemsNotifier {
  EmotionNotifier(SelectedEmotion emotion) : _emotion = emotion;

  SelectedEmotion _emotion;

  SelectedEmotion get emotion => _emotion;

  updateEmotion(BodymoodEmotion emotion) {
    _emotion = EmotionSelected(emotion);
  }

  @override
  reset([bool shouldNotifyListeners = false]) {
    _emotion = EmotionNotSelected();
    if (shouldNotifyListeners) {
      notifyListeners();
    }
  }

  @override
  bool get selected => emotion.map(empty: (_) => false, selected: (_) => true);
}
