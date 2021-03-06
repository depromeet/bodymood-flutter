import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../bloc/auth/controller/auth_token_manager_provider.dart';
import '../../../bloc/editor/api/poster_creation_api.dart';
import '../../../bloc/editor/model/poster_detail.dart';
import '../../../bloc/editor/model/selected_emotion.dart';
import '../../../bloc/editor/riverpod/poster_path_provider.dart';
import '../../../bloc/posters/core/ds/poster_store.dart';
import '../../../bloc/posters/riverpod/poster_album_provider.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';
import '../template_builder/builders.dart';

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
    final templateIndex = ref.read(editorViewPosterEncloser).templateIndex;
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
    return Container(
      key: posterKey,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
      ),
      child: Screenshot(
        controller: screenshotController,
        child: AspectRatio(
          aspectRatio: 327 / 580,
          child: Stack(
            fit: StackFit.expand,
            children: templateBuilders[templateIndex](ref).buildStackChild(),
          ),
        ),
      ),
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
        (ref.read(editorViewPosterEncloser).image as LocalImageStore).path;
    final emotion =
        (ref.read(editorViewPosterEncloser).mood as EmotionSelected).emotion;
    final exercises = ref.read(editorViewPosterEncloser).exercises;

    final tokenManager = ref.read(authTokenManagerProvider);
    final api = BodymoodPosterCreationApi(tokenManager);
    await api.create(
      PosterDetail(
        posterImagePath: posterPath,
        originalImagePath: originalImagePath,
        emotion: emotion,
        exercises: exercises,
      ),
    );
    await ref.read(posterAlbumProvider.notifier).refresh();
  }
}
