import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';

class FinishEmotionSelectionButton extends ConsumerWidget {
  const FinishEmotionSelectionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isEmotionSelected =
        ref.watch(editorViewPosterEncloser).isMoodSelected;
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
