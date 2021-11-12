import 'package:flutter/material.dart';

import '../../../bloc/editor/riverpod/selected_emotion_provider.dart';
import '../../../bloc/editor/riverpod/selected_exercise_provider.dart';
import '../../../bloc/editor/riverpod/selected_photo_provider.dart';
import 'checker.dart';

class EditProgressCheckerBar extends StatelessWidget {
  const EditProgressCheckerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        EditProgressChecker(
          title: '사진',
          provider: selectedImageProvider,
        ),
        const SizedBox(width: 16),
        EditProgressChecker(
          title: '운동',
          provider: selectedExerciseProvider,
        ),
        const SizedBox(width: 16),
        EditProgressChecker(
          title: '감정',
          provider: selectedEmotionProvider,
        ),
      ],
    );
  }
}
