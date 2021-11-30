import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/editor/model/selected_emotion.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';

class EmotionTag extends ConsumerWidget {
  const EmotionTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final emotion =
        (ref.read(editorViewPosterEncloser).mood as EmotionSelected).emotion;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today\'s Bodymood',
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            height: 32 / 18,
            color: clPrimaryWhite.withOpacity(0.6),
          ),
        ),
        Text(
          emotion.englishTitle,
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            height: 32 / 18,
            color: clPrimaryWhite,
          ),
        ),
      ],
    );
  }
}
