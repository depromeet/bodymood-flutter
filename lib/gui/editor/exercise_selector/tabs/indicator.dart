import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../bloc/editor/riverpod/exercises_provider.dart';
import '../../../../common/carousel_controller_group/carousel_controller_group.dart';
import '../../../../common/carousel_controller_group/carousel_options.dart';
import '../../../constants/color.dart';
import 'riverpod/selected_tab_provider.dart';

class ExerciseTabIndicator extends StatelessWidget {
  const ExerciseTabIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CarouselControllerGroup controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(left: 24),
          height: 1,
          decoration: BoxDecoration(
            color: clPrimaryBlack.withOpacity(0.3),
          ),
          child: Stack(
            children: [
              _SelectedTabResponder(controller: controller),
              _SelectedTabIndicator(
                maxBarWidth: constraints.maxWidth,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SelectedTabResponder extends ConsumerStatefulWidget {
  const _SelectedTabResponder({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CarouselControllerGroup controller;

  @override
  ConsumerState<_SelectedTabResponder> createState() =>
      _SelectedTabResponderState();
}

class _SelectedTabResponderState extends ConsumerState<_SelectedTabResponder> {
  StateController<int>? _selectedTabState;
  @override
  void initState() {
    super.initState();
    widget.controller.addPageChangedListener(_changeSelectedTabTo);
    _selectedTabState = ref.read(selectedTabProvider);
  }

  @override
  void dispose() {
    _selectedTabState?.state = 0;
    widget.controller.removePageChangedListener(_changeSelectedTabTo);
    super.dispose();
  }

  _changeSelectedTabTo(int index, _) {
    _selectedTabState?.state = index;
  }

  @override
  Widget build(BuildContext context) {
    final exercises = ref.watch(exercisesProvider);
    return CarouselSlider.builder(
      carouselController: widget.controller,
      itemBuilder: (_, __, ___) => const SizedBox.shrink(),
      itemCount: 10,
      options: getSyncAllCarouselOption(
        widget.controller,
        viewportFraction: 1 /
            exercises.maybeMap<num>(
              orElse: () => 1.0,
              data: (data) {
                return data.value.length;
              },
            ),
      ),
    );
  }
}

class _SelectedTabIndicator extends ConsumerWidget {
  const _SelectedTabIndicator({
    Key? key,
    required this.maxBarWidth,
  }) : super(key: key);

  final double maxBarWidth;

  @override
  Widget build(BuildContext context, ref) {
    final selectedTab = ref.watch(selectedTabProvider).state;
    final movingWindow = maxBarWidth / 7;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      top: 0,
      bottom: 0,
      left: movingWindow * selectedTab,
      child: Container(
        width: 70,
        height: 1,
        decoration: const BoxDecoration(
          color: clPrimaryBlack,
        ),
      ),
    );
  }
}
