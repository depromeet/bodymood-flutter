import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../../constants/color.dart';

class FirstTemplateExercisesTag extends ConsumerWidget {
  const FirstTemplateExercisesTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exercisesText =
        ref.read(editorViewPosterEncloser).exercises.fold<String>(
              '',
              (previousValue, exercise) =>
                  previousValue + '\n' + exercise.englishName,
            );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FittedBox(
        child: Text(
          exercisesText,
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            height: 1.3,
            color: clPrimaryWhite,
          ),
        ),
      ),
    );
  }
}
