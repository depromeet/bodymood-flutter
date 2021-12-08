import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../bloc/editor/model/selected_emotion.dart';
import '../../constants/color.dart';
import 'util/emotion_to_gradient.dart';

class EmotionColorCircle extends StatelessWidget {
  const EmotionColorCircle({
    Key? key,
    required this.isEmotionSelected,
    required this.mood,
  }) : super(key: key);

  final bool isEmotionSelected;
  final SelectedMood mood;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 1,
      color: const Color.fromRGBO(0x50, 0x50, 0x50, 0.7),
      borderType: BorderType.Circle,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isEmotionSelected ? null : clPrimaryWhite.withOpacity(0.5),
          gradient: isEmotionSelected
              ? emotionToLinearGradient(
                  (mood as EmotionSelected).emotion,
                )
              : null,
        ),
      ),
    );
  }
}
