import '../../../constants/color.dart';
import '../models/exercise_detail.dart';
import '../models/selected_exercises.dart';
import '../../riverpod/exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseDetailItem extends ConsumerWidget {
  ExerciseDetailItem({
    Key? key,
    required ExerciseDetail detail,
    required this.categoryNum,
    required this.detailNum,
  }) : super(key: key) {
    _thisItem = SelectedExercise(
      detail: detail,
      categoryNum: categoryNum,
      detailNum: detailNum,
    );
  }

  final int categoryNum;
  final int detailNum;
  late final SelectedExercise _thisItem;

  @override
  Widget build(BuildContext context, ref) {
    final selectedItems = ref.watch(selectedExerciseProvider);
    final isSelected =
        selectedItems.exercises.any((selected) => selected == _thisItem);
    final backgroundColor =
        isSelected ? clPrimaryBlack.withOpacity(0.1) : Colors.white;
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
        height: 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _thisItem.detail.englishTitle,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.bold,
                color: clPrimaryBlack,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              _thisItem.detail.koreanTitle,
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