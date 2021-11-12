import 'package:flutter/material.dart';

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
      children: const [
        PosterItemSelectorArea(
          child: PosterImageSelector(),
        ),
        SizedBox(height: 24),
        PosterItemSelectorArea(
          child: PosterExerciseSelector(),
        ),
        SizedBox(height: 24),
        PosterItemSelectorArea(
          child: PosterEmotionSelector(),
        ),
      ],
    );
  }
}
