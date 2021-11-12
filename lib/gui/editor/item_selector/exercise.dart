import 'title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosterExerciseSelector extends ConsumerWidget {
  const PosterExerciseSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return TextButton(
      onPressed: () {},
      child: const Center(
        child: ItemSelectorTitle(
          itemTitle: '운동을 선택하세요',
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    );
  }
}
