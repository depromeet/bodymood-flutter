import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/editor/model/selected_emotion.dart';
import '../../../encloser/editor_view/editor_view_page_encloser.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';
import '../emotion_selector/emotion_color_circle.dart';
import 'title.dart';

class PosterEmotionSelector extends ConsumerWidget {
  const PosterEmotionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posterState = ref.watch(editorViewPosterEncloser);
    final isEmotionSelected = posterState.isMoodSelected;
    final fontColor = posterState.isImageSelected || posterState.isMoodSelected
        ? clPrimaryWhite
        : const Color.fromRGBO(80, 80, 80, 0.7);
    final title = isEmotionSelected
        ? _buildEmotionTitle(posterState.mood, fontColor)
        : const ItemSelectorTitle(
            itemTitle: '감정을 선택하세요',
          );
    return MaterialButton(
      onPressed: () {
        ref.read(editorViewPageEncloser).showMoodPage();
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title,
            const SizedBox(height: 16),
            EmotionColorCircle(
              isEmotionSelected: isEmotionSelected,
              mood: posterState.mood,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildEmotionTitle(SelectedMood selectedEmotion, Color fontColor) {
    final emotion = (selectedEmotion as EmotionSelected).emotion;
    var englishTitle = Text(
      emotion.englishTitle,
      style: GoogleFonts.playfairDisplay(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.1,
        color: fontColor,
      ),
    );
    var koreanTitle = Text(
      emotion.koreanTitle,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        height: 14 / 12,
        color: fontColor,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        englishTitle,
        const SizedBox(height: 8),
        koreanTitle,
      ],
    );
  }
}
