import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../encloser/editor_view/editor_view_poster_state.dart';
import 'item_selector/area.dart';
import 'item_selector/emotion.dart';
import 'item_selector/exercise.dart';
import 'item_selector/image.dart';

class ItemSelector extends ConsumerWidget {
  const ItemSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posterState = ref.watch(editorViewPosterEncloser);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        PosterItemSelectorArea(
          child: const PosterImageSelector(),
          selected: posterState.isImageSelected,
        ),
        const SizedBox(height: 24),
        PosterItemSelectorArea(
          child: const PosterExerciseSelector(),
          selected: posterState.isExerciseSelected,
        ),
        const SizedBox(height: 24),
        PosterItemSelectorArea(
          child: const PosterEmotionSelector(),
          selected: posterState.isMoodSelected,
        ),
      ],
    );
  }
}
