import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';
import '../model/predefined_template.dart';

class TemplateHolderCarousel extends ConsumerStatefulWidget {
  const TemplateHolderCarousel({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      TemplateHolderCarouselState();
}

class TemplateHolderCarouselState
    extends ConsumerState<TemplateHolderCarousel> {
  final _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    ref.listen<int>(
      editorViewPosterEncloser.select((poster) => poster.templateIndex),
      (index) {
        _controller.animateToPage(index);
      },
    );
    final templateIndex = ref
        .watch(editorViewPosterEncloser.select((value) => value.templateIndex));
    return Center(
      child: SizedBox(
        width: 220,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CarouselSlider.builder(
              itemCount: predefinedTemplate.length,
              itemBuilder: (context, index, realIndex) {
                final template = predefinedTemplate[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      template.engTitle,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                        height: 29 / 22,
                        fontWeight: FontWeight.bold,
                        color: clPrimaryBlack,
                      ),
                    ),
                    const SizedBox(height: 2.6),
                    Text(
                      template.korTitle,
                      style: TextStyle(
                        fontSize: 14,
                        height: 17 / 14,
                        fontWeight: FontWeight.bold,
                        color: clPrimaryBlack.withOpacity(0.7),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  ref.read(editorViewPosterEncloser).setTemplate(index);
                },
                enableInfiniteScroll: false,
                viewportFraction: 1,
                clipBehaviour: Clip.hardEdge,
              ),
              carouselController: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                templateIndex != 0
                    ? IconButton(
                        onPressed: () {
                          ref
                              .read(editorViewPosterEncloser)
                              .setTemplate(templateIndex - 1);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        padding: EdgeInsets.zero,
                      )
                    : const SizedBox.shrink(),
                templateIndex != predefinedTemplate.length - 1
                    ? IconButton(
                        onPressed: () {
                          ref
                              .read(editorViewPosterEncloser)
                              .setTemplate(templateIndex + 1);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        padding: EdgeInsets.zero,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
