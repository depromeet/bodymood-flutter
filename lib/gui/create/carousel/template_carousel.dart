import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../model/predefined_template.dart';

class TemplateCarousel extends ConsumerStatefulWidget {
  const TemplateCarousel({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      TemplateCarouselState();
}

class TemplateCarouselState extends ConsumerState<TemplateCarousel> {
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(
      editorViewPosterEncloser.select((poster) => poster.templateIndex),
      (templateIndex) {
        _controller.animateToPage(templateIndex);
      },
    );
    return CarouselSlider(
      carouselController: _controller,
      items: predefinedTemplate.map(
        (e) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                ],
              ),
              child: e,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        aspectRatio: 247 / 437,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enableInfiniteScroll: false,
        viewportFraction: 247 / 375,
        clipBehaviour: Clip.none,
        onPageChanged: (index, reason) {
          ref.read(editorViewPosterEncloser).setTemplate(index);
        },
      ),
    );
  }
}
