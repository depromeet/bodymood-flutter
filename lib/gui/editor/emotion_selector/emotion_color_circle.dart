import 'package:bodymood/bloc/editor/model/selected_emotion.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/emotion_selector/util/emotion_to_gradient.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EmotionColorCircle extends StatelessWidget {
  const EmotionColorCircle({
    Key? key,
    required this.isEmotionSelected,
    required this.selectedEmotion,
  }) : super(key: key);

  final bool isEmotionSelected;
  final EmotionNotifier selectedEmotion;

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
                  (selectedEmotion.emotion as EmotionSelected).emotion,
                )
              : null,
        ),
      ),
    );
  }
}
