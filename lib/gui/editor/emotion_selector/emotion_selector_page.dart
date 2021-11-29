import '../../../bloc/editor/riverpod/selected_emotion_provider.dart';
import '../../constants/color.dart';
import 'emotion_grid_view.dart';
import 'finish_emotion_selection_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/path.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';

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
        final emotion = ref.watch(selectedEmotionProvider);
        final color = emotion.fontColor;
        return BodymoodBackButton(
          color: color,
        );
      },
    );
  }
}
