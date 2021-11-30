import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../../constants/color.dart';
import '../../emotion_selector/util/hex_to_color.dart';

Color getFontColorFromMood(Reader read) {
  final emotion = read(editorViewPosterEncloser).mood;
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
