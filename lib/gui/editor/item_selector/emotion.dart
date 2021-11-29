import '../../../bloc/editor/model/selected_emotion.dart';
import '../../../bloc/editor/riverpod/selected_emotion_provider.dart';
import '../../../bloc/editor/riverpod/selected_photo_provider.dart';
import '../../constants/color.dart';
import '../emotion_selector/emotion_color_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/editor/poster_editor_state_manager.dart';
import 'title.dart';

class PosterEmotionSelector extends ConsumerWidget {
  const PosterEmotionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final imageSelected = ref.watch(selectedImageProvider).selected;
    final selectedEmotion = ref.watch(selectedEmotionProvider);
    final isEmotionSelected = selectedEmotion.selected;
    final fontColor = imageSelected || selectedEmotion.selected
        ? clPrimaryWhite
        : const Color.fromRGBO(80, 80, 80, 0.7);
    final title = isEmotionSelected
        ? _buildEmotionTitle(selectedEmotion.emotion, fontColor)
        : const ItemSelectorTitle(
            itemTitle: '감정을 선택하세요',
          );
    return MaterialButton(
      onPressed: () {
        ref.read(posterEditorStateManagerProvider).selectEmotion();
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
              selectedEmotion: selectedEmotion,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildEmotionTitle(SelectedEmotion selectedEmotion, Color fontColor) {
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
