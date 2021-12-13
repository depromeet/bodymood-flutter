import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';

class ReturnExerciseButton extends ConsumerWidget {
  const ReturnExerciseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posterState = ref.watch(editorViewPosterEncloser);
    final maxExercises = posterState.maxNumOfEx;
    final selectedExercises = posterState.exercises;
    final isSelected = selectedExercises.isNotEmpty;
    final buttonColor = isSelected ? clPrimaryBlack : clGray400;

    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
      },
      padding: EdgeInsets.zero,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 56,
        color: buttonColor,
        child: Center(
          child: Text(
            '운동 선택 (${selectedExercises.length}/$maxExercises)',
            style: const TextStyle(
              fontSize: 16,
              height: 19 / 16,
              color: clPrimaryWhite,
            ),
          ),
        ),
      ),
    );
  }
}
