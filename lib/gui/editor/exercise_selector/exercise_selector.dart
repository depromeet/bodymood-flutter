import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../../routes/path.dart';
import '../../constants/color.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';
import '../../widgets/appbar/text_title.dart';
import '../emotion_selector/emotional_background.dart';
import 'return_button.dart';
import 'tabs/selector_body.dart';
import 'util/get_font_color.dart';

class ExerciseSelectionPage extends ConsumerWidget {
  const ExerciseSelectionPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.selectExercises,
      key: ValueKey(BodymoodPath.selectExercises),
      child: ExerciseSelectionPage(),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final posterDetail = ref.watch(editorViewPosterEncloser);
    final isMoodSelected = posterDetail.isMoodSelected;
    var onSurfaceColor = clPrimaryBlack;
    if (isMoodSelected) {
      onSurfaceColor = getFontColorFromMood(ref.read);
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const EmotionalBackground(onlySelected: true),
            Column(
              children: [
                BodymoodAppbar(
                  leading: BodymoodBackButton(
                    color: onSurfaceColor,
                  ),
                  title: AppbarTextTitle(
                    title: '운동 선택',
                    titleColor: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 18),
                const Expanded(
                  child: ExerciseSelectorBody(),
                ),
                const ReturnExerciseButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
