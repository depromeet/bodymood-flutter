import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/editor/model/emotion.dart';
import '../../../bloc/editor/model/selected_emotion.dart';
import 'seletable_item_notifier.dart';

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
      ;
    }
  }

  @override
  bool get selected => emotion.map(empty: (_) => false, selected: (_) => true);
}
