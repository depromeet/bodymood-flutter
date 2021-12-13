import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../emotion_selector/emotional_background.dart';
import '../builder_base.dart';
import 'emotion_tag.dart';
import 'exercises_tag.dart';

class FirstTemplateBuilder extends TemplateBuilder {
  final WidgetRef ref;

  FirstTemplateBuilder(this.ref);

  Column _buildExercisesTag() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Spacer(flex: 209),
        FirstTemplateExercisesTag(),
        Spacer(flex: 230),
      ],
    );
  }

  @override
  List<Widget> buildStackChild() {
    final imageProvider = (ref.read(editorViewPosterEncloser).imageProvider)!;
    return [
      Image(
        image: imageProvider,
        fit: BoxFit.cover,
      ),
      const EmotionalBackground(opacity: 0.4),
      _buildExercisesTag(),
      const Positioned(
        bottom: 30,
        left: 26,
        child: FirstTemplateEmotionTag(),
      ),
    ];
  }
}
