import 'dart:math';

import 'tab_bar_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../bloc/editor/riverpod/exercises_provider.dart';
import '../../../../common/carousel_controller_group/carousel_controller_group.dart';
import '../../../../common/carousel_controller_group/carousel_options.dart';
import '../../../constants/color.dart';

class ExerciseTabBar extends ConsumerWidget {
  const ExerciseTabBar({
    Key? key,
    required this.controller,
    required this.tabHeight,
  }) : super(key: key);

  final CarouselControllerGroup controller;
  final double tabHeight;

  double _getTabViewportFraction(
    double deviceWidth, [
    double tabWidth = 140.0,
    double leftPadding = 24.0,
  ]) {
    // TODO: this formula is approximate.
    final a = deviceWidth;
    final b = 2 * (leftPadding - deviceWidth);
    final c = tabWidth;
    // 근의 공식 적용
    final x1 = (-b - sqrt(pow(b, 2) - (4 * a * c))) / (2 * a);
    final x2 = (-b + sqrt(pow(b, 2) - (4 * a * c))) / (2 * a);
    if (x1 < 0) {
      return x2;
    } else if (x2 < 0) {
      return x1;
    } else {
      return x1 > x2 ? x2 : x1;
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final exercises = ref.watch(exercisesProvider);
    final viewportSize = MediaQuery.of(context).size;
    final deviceWidth = viewportSize.width;
    const tabWidth = 150.0;
    const leftPadding = 24.0;
    final viewportFraction =
        _getTabViewportFraction(deviceWidth, tabWidth, leftPadding);
    // according to _SliverViewportFractionPadding
    final leftPaddingFraction = (1 - viewportFraction) / 2;
    final leftTransform = deviceWidth * leftPaddingFraction - 2 * leftPadding;
    final finalTabBarWidth = deviceWidth + leftTransform * 2;

    return exercises.map(
      data: (data) {
        final list = data.value;
        return Transform.translate(
          offset: Offset(-leftTransform, 0),
          child: OverflowBox(
            maxWidth: finalTabBarWidth,
            child: ConstraintsTransformBox(
              constraintsTransform: (old) {
                return old.copyWith(
                  minWidth: finalTabBarWidth,
                  maxWidth: finalTabBarWidth,
                );
              },
              child: CarouselSlider.builder(
                carouselController: controller,
                itemBuilder: (context, index, realIndex) {
                  return ExerciseTabBarItem(
                    controller: controller,
                    tabWidth: tabWidth,
                    list: list,
                    index: index,
                  );
                },
                itemCount: list.length,
                options: getSyncAllCarouselOption(
                  controller,
                  viewportFraction: viewportFraction,
                  aspectRatio: tabWidth / tabHeight,
                ),
              ),
            ),
          ),
        );
      },
      error: (_) {
        return const Center(
          child: Text('서버 오류'),
        );
      },
      loading: (_) {
        return const Center(
          child: RefreshProgressIndicator(
            color: clPrimaryBlack,
          ),
        );
      },
    );
  }
}
