import '../../../../common/carousel_controller_group/carousel_controller_group.dart';
import 'page.dart';
import 'indicator.dart';
import 'tab_bar.dart';
import 'package:flutter/material.dart';

class ExerciseSelectorBody extends StatefulWidget {
  const ExerciseSelectorBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseSelectorBody> createState() => _ExerciseSelectorBodyState();
}

class _ExerciseSelectorBodyState extends State<ExerciseSelectorBody> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 52,
          child: ExerciseTabBar(
            controller: _controller,
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
