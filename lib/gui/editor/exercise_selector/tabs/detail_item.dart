import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/editor/model/exercise_detail.dart';
import '../../../../encloser/editor_view/editor_view_poster_state.dart';
import '../util/get_font_color.dart';

class ExerciseDetailItem extends ConsumerWidget {
  ExerciseDetailItem({
    Key? key,
    required ExerciseDetail detail,
  }) : super(key: key) {
    _thisItem = detail;
  }

  late final ExerciseDetail _thisItem;

  @override
  Widget build(BuildContext context, ref) {
    final isSelected =
        ref.watch(editorViewPosterEncloser).containsExercise(_thisItem);
    final fontColor = getFontColorFromMood(ref.read);
    final backgroundColor =
        isSelected ? fontColor.withOpacity(0.1) : Colors.transparent;
    final padding =
        isSelected ? const EdgeInsets.only(left: 24) : EdgeInsets.zero;

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        final posterState = ref.read(editorViewPosterEncloser);
        if (!isSelected) {
          posterState.addExercise(_thisItem);
        } else {
          posterState.removeExercise(_thisItem);
        }
      },
      child: Container(
        color: backgroundColor,
        padding: padding,
        height: 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _thisItem.englishName,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              _thisItem.koreanName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                height: 14 / 12,
                color: fontColor.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
