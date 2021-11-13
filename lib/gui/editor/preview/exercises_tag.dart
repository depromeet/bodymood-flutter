import 'package:bodymood/bloc/editor/riverpod/selected_exercise_provider.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisesTag extends ConsumerWidget {
  const ExercisesTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exercises = ref.read(selectedExerciseProvider).exercises.fold<String>(
        '',
        (previousValue, element) =>
            previousValue + '\n' + element.detail.englishName);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FittedBox(
        child: Text(
          exercises,
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
