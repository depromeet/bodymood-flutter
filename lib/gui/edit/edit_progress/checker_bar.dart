import 'checker.dart';
import '../riverpod/emotion_provider.dart';
import '../riverpod/exercise_provider.dart';
import '../riverpod/photo_provider.dart';
import 'package:flutter/material.dart';

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
          provider: selectedPhotoProvider,
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
