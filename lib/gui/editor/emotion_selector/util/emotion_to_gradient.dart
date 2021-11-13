import 'package:bodymood/bloc/editor/model/emotion.dart';
import 'package:bodymood/gui/editor/emotion_selector/util/hex_to_color.dart';
import 'package:flutter/material.dart';

Gradient emotionToLinearGradient(BodymoodEmotion emotion,
    [double opacity = 1.0]) {
  final startColor = stringHexToColor(emotion.startColor);
  final endColor = stringHexToColor(emotion.endColor);
  return LinearGradient(
    colors: [
      startColor.withOpacity(opacity),
      endColor.withOpacity(opacity),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
