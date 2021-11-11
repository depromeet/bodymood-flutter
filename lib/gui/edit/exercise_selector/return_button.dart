import '../../constants/color.dart';
import '../riverpod/exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReturnExerciseButton extends ConsumerWidget {
  const ReturnExerciseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final selectedExercisesNotifier =
        ref.watch(selectedExerciseProvider.notifier);
    final selectedExercises = ref.watch(selectedExerciseProvider);
    final isSelected = selectedExercisesNotifier.selected;
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
            '운동 선택 (${selectedExercises.exercises.length}/3)',
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
