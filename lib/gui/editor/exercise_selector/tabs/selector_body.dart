import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/carousel_controller_group/carousel_controller_group.dart';
import 'indicator.dart';
import 'page.dart';
import 'tab_bar.dart';

class ExerciseSelectorBody extends ConsumerStatefulWidget {
  const ExerciseSelectorBody({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ExerciseSelectorBody> createState() =>
      _ExerciseSelectorBodyState();
}

class _ExerciseSelectorBodyState extends ConsumerState<ExerciseSelectorBody> {
  final _controller = CarouselControllerGroup();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabHeight = 52.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: tabHeight,
          child: ExerciseTabBar(
            controller: _controller,
            tabHeight: tabHeight,
          ),
        ),
        const SizedBox(height: 18),
        ExerciseTabIndicator(
          controller: _controller,
        ),
        const SizedBox(height: 50),
        Expanded(
          child: ExerciseTabPage(
            controller: _controller,
          ),
        ),
      ],
    );
  }
}
