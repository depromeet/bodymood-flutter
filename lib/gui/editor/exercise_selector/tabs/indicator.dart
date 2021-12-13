import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/color.dart';
import 'riverpod/selected_tab_provider.dart';

class ExerciseTabIndicator extends StatelessWidget {
  const ExerciseTabIndicator({
    Key? key,
  }) : super(key: key);

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
