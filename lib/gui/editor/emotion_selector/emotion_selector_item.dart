import 'package:bodymood/bloc/editor/model/emotion.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/emotion_selector/util/hex_to_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionSelectorItem extends ConsumerWidget {
  const EmotionSelectorItem({
    Key? key,
    required this.emotion,
  }) : super(key: key);

  final BodymoodEmotion emotion;

  @override
  Widget build(BuildContext context, ref) {
    final emotionNotifier = ref.watch(selectedEmotionProvider);
    final selectedEmotion = emotionNotifier.emotion;
    final isSelected = selectedEmotion.maybeMap(
      selected: (selected) {
        return selected.emotion == emotion;
      },
      orElse: () => false,
    );
    final fontColor = selectedEmotion.map(
      empty: (_) => clPrimaryWhite,
      selected: (selected) => stringHexToColor(selected.emotion.fontColor),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ref.read(selectedEmotionProvider).updateEmotion(emotion);
      },
      child: Opacity(
        opacity: isSelected | !emotionNotifier.selected ? 1.0 : 0.5,
        child: SizedBox(
          height: 94,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildKoreanTitle(fontColor, isSelected),
              const SizedBox(height: 5),
              _buildEnglishTitle(fontColor, isSelected),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildEnglishTitle(Color textColor, bool isSelected) => Text(
        emotion.englishTitle,
        style: GoogleFonts.playfairDisplay(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
          height: 16 / 12,
          color: textColor,
          shadows: isSelected
              ? const [
                  Shadow(
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ]
              : const [],
        ),
      );

  Text _buildKoreanTitle(Color textColor, bool isSelected) => Text(
        emotion.koreanTitle,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.w800 : FontWeight.normal,
          fontSize: 18,
          height: 1.5,
          color: textColor,
          shadows: isSelected
              ? const [
                  Shadow(
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ]
              : const [],
        ),
      );
}
