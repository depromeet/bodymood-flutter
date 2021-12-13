import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_page_encloser.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';
import 'title.dart';

class PosterExerciseSelector extends ConsumerWidget {
  const PosterExerciseSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posterState = ref.watch(editorViewPosterEncloser);
    const unselectedBody = Center(
      child: ItemSelectorTitle(
        itemTitle: '운동을 선택하세요',
      ),
    );
    return TextButton(
      onPressed: () {
        ref.read(editorViewPageEncloser).showExercisePage();
      },
      child: posterState.isExerciseSelected
          ? _buildSelectedExerciseText(
              posterState.exercises.map((e) => e.englishName).toList(),
              posterState,
            )
          : unselectedBody,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildSelectedExerciseText(
      List<String> names, EditorViewPosterEncloser posterState) {
    final backgroundFilled =
        posterState.isImageSelected || posterState.isMoodSelected;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          names.fold(
            '',
            (aggregated, exercise) => aggregated + '\n' + exercise,
          ),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.3,
            color: backgroundFilled ? clPrimaryWhite : clPrimaryBlack,
          ),
        ),
      ),
    );
  }
}
