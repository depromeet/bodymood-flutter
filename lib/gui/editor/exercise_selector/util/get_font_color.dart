import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/emotion_selector/util/hex_to_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Color getFontColor(Reader read) {
  final emotion = read(selectedEmotionProvider).emotion;
  final color = emotion.map(
    empty: (_) {
      return clPrimaryBlack;
    },
    selected: (selected) {
      return stringHexToColor(selected.emotion.fontColor);
    },
  );
  return color;
}
