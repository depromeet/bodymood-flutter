import '../../../../common/carousel_controller_group/carousel_controller_group.dart';
import '../../../../common/carousel_controller_group/carousel_options.dart';
import '../../../constants/color.dart';
import '../models/exercise_detail.dart';
import '../riverpod/exercises.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'detail_item.dart';

class ExerciseTabPage extends ConsumerWidget {
  const ExerciseTabPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CarouselControllerGroup controller;
  @override
  Widget build(BuildContext context, ref) {
    final exercisesValue = ref.watch(exercisesProvider);

    return exercisesValue.map(
      data: _buildCategoryPage,
      error: _buildErrorPage,
      loading: _buildLoadingPage,
    );
  }

  Widget _buildCategoryPage(data) {
    final exercises = data.value;
    return CarouselSlider.builder(
      carouselController: controller,
      itemBuilder: (context, pageIndex, _) {
        final subs = exercises[pageIndex].details;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: _buildExerciseList(subs, pageIndex),
        );
      },
      itemCount: exercises.length,
      options: getSyncAllCarouselOption(
        controller,
      ),
    );
  }

  Widget _buildExerciseList(List<ExerciseDetail> subs, int categoryNum) {
    return ListView.builder(
      itemCount: subs.length,
      itemBuilder: (context, detailIndex) {
        final detail = subs[detailIndex];
        return ExerciseDetailItem(
          detail: detail,
          categoryNum: categoryNum,
          detailNum: detailIndex,
        );
      },
    );
  }

  Widget _buildLoadingPage(_) {
    return const Center(
      child: RefreshProgressIndicator(
        color: clPrimaryBlack,
      ),
    );
  }

  Widget _buildErrorPage(_) {
    return const Text('server error');
  }
}
