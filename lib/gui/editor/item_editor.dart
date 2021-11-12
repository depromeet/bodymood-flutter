import 'package:flutter/material.dart';

import '../../bloc/editor/riverpod/emotion_provider.dart';
import '../../bloc/editor/riverpod/exercise_provider.dart';
import '../../bloc/editor/riverpod/photo_provider.dart';
import 'item_selector/area.dart';
import 'item_selector/emotion.dart';
import 'item_selector/exercise.dart';
import 'item_selector/photo.dart';

class ItemSelector extends StatelessWidget {
  const ItemSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        PosterItemSelectorArea(
          child: const PosterPhotoSelector(),
          provider: selectedPhotoProvider,
        ),
        const SizedBox(height: 24),
        PosterItemSelectorArea(
          child: const PosterExerciseSelector(),
          provider: selectedExerciseProvider,
        ),
        const SizedBox(height: 24),
        PosterItemSelectorArea(
          child: const PosterEmotionSelector(),
          provider: selectedEmotionProvider,
        ),
      ],
    );
  }
}
