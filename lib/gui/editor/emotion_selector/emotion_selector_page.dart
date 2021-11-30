import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../../routes/path.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';
import 'emotion_grid_view.dart';
import 'finish_emotion_selection_button.dart';
import 'util/hex_to_color.dart';

class MoodSelectionPage extends StatelessWidget {
  const MoodSelectionPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.selectEmotion,
      key: ValueKey(BodymoodPath.selectEmotion),
      child: MoodSelectionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const EmotionGridView(),
          SafeArea(
            child: BodymoodAppbar(
              leading: _buildReactiveBackButton(),
              title: const SizedBox.shrink(),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FinishEmotionSelectionButton(),
          ),
        ],
      ),
    );
  }

  Consumer _buildReactiveBackButton() {
    return Consumer(
      builder: (context, ref, _) {
        final emotion = ref.watch(editorViewPosterEncloser).mood;
        final color = emotion.map(
          empty: (_) => Colors.black,
          selected: (selected) => stringHexToColor(selected.emotion.fontColor),
        );
        return BodymoodBackButton(
          color: color,
        );
      },
    );
  }
}
