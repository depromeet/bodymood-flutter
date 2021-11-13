import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_exercise_provider.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/editor/poster_editor_state_manager.dart';
import '../../../resources/resources.dart';
import '../../constants/color.dart';

class CreatePosterButton extends ConsumerWidget {
  const CreatePosterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final buttonBoxDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: clPrimaryBlack,
      boxShadow: [
        BoxShadow(
          blurRadius: 8,
          offset: const Offset(0, 4),
          color: const Color(0xff000000).withOpacity(0.3),
        ),
      ],
    );
    final buttonIcon = SvgPicture.asset(
      BodymoodImages.plusIcon,
      height: 24,
    );
    return Center(
      child: Container(
        width: 56,
        height: 56,
        decoration: buttonBoxDecoration,
        child: TextButton(
          onPressed: () {
            ref.read(selectedEmotionProvider).reset();
            ref.read(selectedExerciseProvider).reset();
            ref.read(selectedImageProvider).reset();
            ref.read(posterEditorStateManagerProvider).createPoster();
          },
          style: TextButton.styleFrom(
            shape: const CircleBorder(),
          ),
          child: buttonIcon,
        ),
      ),
    );
  }
}
