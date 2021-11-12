import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/editor/poster_editor_state_manager.dart';
import 'title.dart';

class PosterEmotionSelector extends ConsumerWidget {
  const PosterEmotionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return MaterialButton(
      onPressed: () {
        ref.read(posterEditorStateManagerProvider).selectEmotion();
      },
      child: const Center(
        child: ItemSelectorTitle(
          itemTitle: '감정을 선택하세요',
        ),
      ),
    );
  }
}
