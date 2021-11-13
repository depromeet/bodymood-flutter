import 'package:bodymood/common/carousel_controller_group/carousel_controller_group.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/exercise_selector/tabs/riverpod/selected_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../bloc/editor/model/exercise_category.dart';

class ExerciseTabBarItem extends ConsumerWidget {
  const ExerciseTabBarItem({
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

    return FittedBox(
      child: GestureDetector(
        onTap: () {
          controller.animateToPage(index);
          controller.syncAll(index);
        },
        behavior: HitTestBehavior.opaque,
        child: AnimatedOpacity(
          duration: animationDuration,
          opacity: mainOpacity,
          child: Container(
            width: tabWidth,
            margin: const EdgeInsets.only(right: 16),
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
        list[index].koreanName,
      ),
    );
  }

  AnimatedDefaultTextStyle _buildEnglishTitle(
      Duration animationDuration, double englishFontSize) {
    return AnimatedDefaultTextStyle(
      duration: animationDuration,
      child: Text(
        list[index].englishName,
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
