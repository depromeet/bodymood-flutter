import 'carousel_controller_group.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

CarouselOptions getSyncAllCarouselOption(
  CarouselControllerGroup controller, {
  double viewportFraction = 1.0,
  double aspectRatio = 16 / 9,
  Axis scrollDirextion = Axis.horizontal,
  bool disableCenter = true,
  CenterPageEnlargeStrategy enlargeStrategy = CenterPageEnlargeStrategy.scale,
}) {
  return CarouselOptions(
    enableInfiniteScroll: false,
    onPageChanged: (index, reason) {
      controller.syncAll(index, reason);
    },
    disableCenter: disableCenter,
    viewportFraction: viewportFraction,
    scrollPhysics: const BouncingScrollPhysics(),
    aspectRatio: aspectRatio,
    scrollDirection: scrollDirextion,
    enlargeStrategy: enlargeStrategy,
  );
}
