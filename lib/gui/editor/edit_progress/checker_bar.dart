import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import 'checker.dart';

class EditProgressCheckerBar extends ConsumerWidget {
  const EditProgressCheckerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posterState = ref.watch(editorViewPosterEncloser);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        EditProgressChecker(
          title: '사진',
          selected: posterState.isImageSelected,
        ),
        const SizedBox(width: 16),
        EditProgressChecker(
          title: '운동',
          selected: posterState.isExerciseSelected,
        ),
        const SizedBox(width: 16),
        EditProgressChecker(
          title: '감정',
          selected: posterState.isMoodSelected,
        ),
      ],
    );
  }
}
