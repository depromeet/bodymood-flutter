import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bloc/editor/model/exercise_detail.dart';
import '../../../../bloc/editor/model/selected_emotion.dart';
import '../../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../emotion_selector/emotional_background.dart';
import '../../emotion_selector/util/emotion_to_gradient.dart';
import '../../exercise_selector/util/get_font_color.dart';
import '../builder_base.dart';

class SecondTemplateBuilder extends TemplateBuilder {
  final WidgetRef ref;

  SecondTemplateBuilder(this.ref);

  @override
  List<Widget> buildStackChild() {
    return [
      const EmotionalBackground(opacity: 1.0),
      _buildExerciseTag(),
      _buildTitleTage(),
      _buildImageBackground(),
    ];
  }

  Widget _buildExerciseTag() {
    final _exercises = ref.read(editorViewPosterEncloser).exercises;
    final fontColor = getFontColorFromMood(
      ref.read,
    );
    final exercises = [
      ..._exercises,
      for (int i = 0; i < 6 - _exercises.length; i++)
        const ExerciseDetail(
            englishName: '', koreanName: '', categoryId: 0, detailId: 0),
    ];
    return Column(
      children: [
        const Spacer(flex: 568),
        Expanded(
          flex: 1920 - 568,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(flex: 144),
              Expanded(
                flex: 135,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: FittedBox(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 3 && i < exercises.length; i++)
                              _buildExerciseText(exercises, i, fontColor),
                          ],
                        ),
                        const SizedBox(width: 105),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 3; i < 6 && i < exercises.length; i++)
                              _buildExerciseText(exercises, i, fontColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 801),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseText(
      List<ExerciseDetail> exercises, int i, Color fontColor) {
    return Text(
      exercises[i].englishName.toUpperCase(),
      style: GoogleFonts.mulish(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        height: 1.3,
        color: fontColor,
      ),
    );
  }

  Widget _buildImageBackground() {
    final imageProvider = (ref.read(editorViewPosterEncloser).imageProvider)!;
    return Column(
      children: [
        const Spacer(flex: 568),
        Expanded(
          flex: 1263,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 324),
              Expanded(
                flex: 710,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    final selectedEmotion =
                        ref.read(editorViewPosterEncloser).mood;
                    final gradient = selectedEmotion.map<Gradient>(
                      empty: (_) => const LinearGradient(
                        colors: [
                          Color(0xffc1c1c1),
                          Color(0xff979797),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      selected: (selected) =>
                          emotionToLinearGradient(selected.emotion, 1.0),
                    );
                    return gradient.createShader(rect);
                  },
                  blendMode: BlendMode.softLight,
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(flex: 46),
            ],
          ),
        ),
        const Spacer(flex: 89),
      ],
    );
  }

  Widget _buildTitleTage() {
    final emotion = (ref.read(editorViewPosterEncloser).mood as EmotionSelected)
        .emotion
        .englishTitle;
    final title = emotion + '\nDay';
    final fontColor = getFontColorFromMood(
      ref.read,
    );
    return Column(
      children: [
        const Spacer(flex: 165),
        Expanded(
          flex: 293,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 110),
              Expanded(
                flex: 924,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      title.toUpperCase(),
                      style: GoogleFonts.mulish(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                        fontSize: 160,
                        height: 1.0,
                        letterSpacing: -8,
                        color: fontColor,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.right,
                      softWrap: true,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 46),
            ],
          ),
        ),
        const Spacer(flex: 1462),
      ],
    );
  }
}
