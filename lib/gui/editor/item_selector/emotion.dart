import '../../../routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'title.dart';

class PosterEmotionSelector extends ConsumerWidget {
  const PosterEmotionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(BodymoodPath.chooseEmotion);
      },
      child: const Center(
        child: ItemSelectorTitle(
          itemTitle: '감정을 선택하세요',
        ),
      ),
    );
  }
}
