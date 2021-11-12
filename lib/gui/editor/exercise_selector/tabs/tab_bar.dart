import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/editor/model/exercise_category.dart';
import '../../../../common/carousel_controller_group/carousel_controller_group.dart';
import '../../../../common/carousel_controller_group/carousel_options.dart';
import '../../../constants/color.dart';
import '../riverpod/exercises.dart';
import 'riverpod/selected_tab_provider.dart';

class ExerciseTabBar extends ConsumerWidget {
  const ExerciseTabBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CarouselControllerGroup controller;

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
    const tabWidth = 140.0;
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
                  return _ExerciseTabItem(
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
                  aspectRatio: tabWidth / 52,
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

class _ExerciseTabItem extends ConsumerWidget {
  const _ExerciseTabItem({
    Key? key,
    required this.controller,
    required this.tabWidth,
    required this.index,
    required this.list,
  }) : super(key: key);

  final CarouselControllerGroup controller;
  final double tabWidth;
  final List<ExerciseCategory> list;
  final int index;

  @override
  Widget build(BuildContext context, ref) {
    final selectedTab = ref.watch(selectedTabProvider).state;
    final isSelected = selectedTab == index;
    final mainOpacity = isSelected ? 1.0 : 0.8;
    final englishFontSize = isSelected ? 22.0 : 18.0;
    final koreanFontSize = isSelected ? 14.0 : 12.0;
    const animationDuration = Duration(milliseconds: 300);

    return GestureDetector(
      onTap: () {
        controller.animateToPage(index);
        controller.syncAll(index);
      },
      child: AnimatedOpacity(
        duration: animationDuration,
        opacity: mainOpacity,
        child: Container(
          width: tabWidth,
          margin: const EdgeInsets.only(right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildEnglishTitle(animationDuration, englishFontSize),
              const SizedBox(height: 4),
              _buildKoreanTitle(animationDuration, koreanFontSize),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedDefaultTextStyle _buildKoreanTitle(
      Duration animationDuration, double koreanFontSize) {
    return AnimatedDefaultTextStyle(
      duration: animationDuration,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: koreanFontSize,
        height: 17 / 14,
        color: clPrimaryBlack.withOpacity(0.7),
      ),
      child: Text(
        list[index].koreanTitle,
      ),
    );
  }

  AnimatedDefaultTextStyle _buildEnglishTitle(
      Duration animationDuration, double englishFontSize) {
    return AnimatedDefaultTextStyle(
      duration: animationDuration,
      child: Text(
        list[index].engilshTitle,
      ),
      style: GoogleFonts.playfairDisplay().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: englishFontSize,
        height: 1.4,
        color: clPrimaryBlack,
      ),
    );
  }
}
