import '../../../bloc/editor/riverpod/selected_exercise_provider.dart';
import '../../constants/color.dart';
import 'package:flutter/painting.dart';

import '../../../bloc/editor/poster_editor_state_manager.dart';

import 'title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosterExerciseSelector extends ConsumerWidget {
  const PosterExerciseSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final selectedExercises = ref.watch(selectedExerciseProvider);
    const unselectedBody = Center(
      child: ItemSelectorTitle(
        itemTitle: '운동을 선택하세요',
      ),
    );
    return TextButton(
      onPressed: () {
        ref.read(posterEditorStateManagerProvider).selectExercises();
      },
      child: selectedExercises.selected
          ? _buildSelectedExerciseText(
              selectedExercises.exercises
                  .map(
                    (e) => e.detail.englishName,
                  )
                  .toList(),
            )
          : unselectedBody,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildSelectedExerciseText(List<String> names) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          names.fold(
            '',
            (longName, exercise) => longName + '\n' + exercise,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.3,
            color: clPrimaryWhite,
          ),
        ),
      ),
    );
  }
}
