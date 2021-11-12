import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/emotion_selector/emotion_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/path.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';

class EmotionSelectorPage extends StatelessWidget {
  const EmotionSelectorPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.selectEmotion,
      key: ValueKey(BodymoodPath.selectEmotion),
      child: EmotionSelectorPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const EmotionGridView(),
          const SafeArea(
            child: BodymoodAppbar(
              leading: BodymoodBackButton(
                color: Colors.white,
              ),
              title: SizedBox.shrink(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FinishEmotionSelectionButton(),
          ),
        ],
      ),
    );
  }
}

class FinishEmotionSelectionButton extends ConsumerWidget {
  const FinishEmotionSelectionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isEmotionSelected = ref.watch(selectedEmotionProvider).selected;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: isEmotionSelected ? clPrimaryBlack : clGray400,
        ),
        child: const Center(
          child: Text(
            '선택 완료',
            style: TextStyle(
              fontSize: 16,
              height: 19 / 16,
              color: clPrimaryWhite,
            ),
          ),
        ),
      ),
    );
  }
}
