import 'dart:io';
import 'package:after_layout/after_layout.dart';
import 'package:bodymood/bloc/auth/controller/auth_token_manager_provider.dart';
import 'package:bodymood/bloc/editor/api/poster_creation_api.dart';
import 'package:bodymood/bloc/editor/model/poster_detail.dart';
import 'package:bodymood/bloc/editor/model/selected_emotion.dart';
import 'package:bodymood/bloc/editor/riverpod/poster_path_provider.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_exercise_provider.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_photo_provider.dart';
import 'package:bodymood/bloc/posters/core/ds/poster_store.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/emotion_selector/emotional_background.dart';
import 'package:bodymood/gui/editor/preview/emotion_tag.dart';
import 'package:bodymood/gui/editor/preview/exercises_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class PosterPreview extends ConsumerStatefulWidget {
  const PosterPreview({Key? key}) : super(key: key);

  @override
  ConsumerState<PosterPreview> createState() => _PosterPreviewState();
}

class _PosterPreviewState extends ConsumerState<PosterPreview>
    with AfterLayoutMixin<PosterPreview> {
  final posterKey = GlobalKey();
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final imageProvider = (ref.read(selectedImageProvider).imageProvider)!;
    const boxShadow = [
      BoxShadow(
        blurRadius: 12,
        offset: Offset(0, 8),
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ),
    ];
    final border = Border.all(
      color: clPrimaryWhite,
      width: 5,
    );
    return Screenshot(
      controller: screenshotController,
      child: Container(
        key: posterKey,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          border: border,
        ),
        child: AspectRatio(
          aspectRatio: 327 / 580,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              const EmotionalBackground(opacity: 0.4),
              _buildExercisesTag(),
              const Positioned(
                bottom: 30,
                left: 26,
                child: EmotionTag(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildExercisesTag() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Spacer(flex: 209),
        ExercisesTag(),
        Spacer(flex: 230),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    // capture and save poster to temp dir
    final tempDir = await getTemporaryDirectory();
    final name = DateTime.now().microsecondsSinceEpoch.toString() + '.png';
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    await screenshotController.captureAndSave(
      tempDir.path,
      fileName: name,
      pixelRatio: pixelRatio,
    );

    final posterPath = tempDir.path + '/' + name;
    ref.read(posterPathProvider).state = posterPath;

    final originalImagePath =
        (ref.read(selectedImageProvider).image as LocalImageStore).path;
    final emotion =
        (ref.read(selectedEmotionProvider).emotion as EmotionSelected).emotion;
    final exercises = ref
        .read(selectedExerciseProvider)
        .exercises
        .map((e) => e.detail)
        .toList();

    final tokenManager = ref.read(authTokenManagerProvider);
    final api = BodymoodPosterCreationApi(tokenManager);
    final result = await api.create(
      PosterDetail(
        posterImagePath: posterPath,
        originalImagePath: originalImagePath,
        emotion: emotion,
        exercises: exercises,
      ),
    );
  }
}
