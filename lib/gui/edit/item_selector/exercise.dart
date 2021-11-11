import 'title.dart';
import '../../../interactor/route/riverpod/path_provider.dart';
import '../../../interactor/route/riverpod/route_path_setting.dart';
import '../../../routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosterExerciseSelector extends ConsumerWidget {
  const PosterExerciseSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return TextButton(
      onPressed: () {
        final route = ref.read(currentPathProvider.notifier);
        route.updatePath(
          BodymoodRouteSetting(path: BodymoodPath.chooseExercise),
        );
      },
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
