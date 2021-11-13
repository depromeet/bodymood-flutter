import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/editor/model/exercise_detail.dart';
import '../../../../bloc/editor/model/selected_exercises.dart';
import '../../../../bloc/editor/riverpod/selected_exercise_provider.dart';
import '../../../constants/color.dart';

class ExerciseDetailItem extends ConsumerWidget {
  ExerciseDetailItem({
    Key? key,
    required ExerciseDetail detail,
  }) : super(key: key) {
    _thisItem = SelectedExercise(
      detail: detail,
    );
  }

  late final SelectedExercise _thisItem;

  @override
  Widget build(BuildContext context, ref) {
    final selectedItems = ref.watch(selectedExerciseProvider);
    final isSelected =
        selectedItems.exercises.any((selected) => selected == _thisItem);
    final backgroundColor =
        isSelected ? clPrimaryBlack.withOpacity(0.1) : Colors.transparent;
    final padding =
        isSelected ? const EdgeInsets.only(left: 24) : EdgeInsets.zero;
    return GestureDetector(
      onTap: () {
        final selectedItemNotifier =
            ref.read(selectedExerciseProvider.notifier);
        selectedItemNotifier.updateList(_thisItem);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: backgroundColor,
        padding: padding,
        height: isSelected ? 56 : 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _thisItem.detail.englishName,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.bold,
                color: clPrimaryBlack,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              _thisItem.detail.koreanName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                height: 14 / 12,
                color: clPrimaryBlack.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
