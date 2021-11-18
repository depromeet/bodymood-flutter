import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/emotion_selector/util/hex_to_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/editor/model/emotion.dart';
import '../../../bloc/editor/model/selected_emotion.dart';
import '../base/seletable_item_notifier.dart';

final selectedEmotionProvider = ChangeNotifierProvider<EmotionNotifier>(
  (_) => EmotionNotifier(EmotionNotSelected()),
);

class EmotionNotifier extends PosterItemsNotifier {
  EmotionNotifier(SelectedEmotion emotion) : _emotion = emotion;

  SelectedEmotion _emotion;

  SelectedEmotion get emotion => _emotion;

  updateEmotion(BodymoodEmotion emotion) {
    _emotion = _emotion.map(
      selected: (current) => current.emotion == emotion
          ? EmotionNotSelected()
          : EmotionSelected(emotion),
      empty: (_) => EmotionSelected(emotion),
    );
    notifyListeners();
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
  Color get fontColor => emotion.map(
        empty: (_) => clPrimaryWhite,
        selected: (em) => stringHexToColor(em.emotion.fontColor),
      );
}
