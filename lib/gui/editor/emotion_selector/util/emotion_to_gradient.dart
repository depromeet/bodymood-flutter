import 'package:flutter/material.dart';

import '../../../../bloc/editor/model/emotion.dart';
import 'hex_to_color.dart';

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
