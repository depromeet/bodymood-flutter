import '../../../bloc/editor/model/selected_emotion.dart';
import '../../../bloc/editor/riverpod/selected_emotion_provider.dart';
import '../../constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionTag extends ConsumerWidget {
  const EmotionTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final emotion =
        (ref.read(selectedEmotionProvider).emotion as EmotionSelected).emotion;
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
