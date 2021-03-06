import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_page_encloser.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';

class CompletePosterEditingButton extends ConsumerWidget {
  const CompletePosterEditingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final completed = ref.watch(editorViewPosterEncloser).isCompleted;
    return SizedBox(
      height: 44,
      width: 44,
      child: TextButton(
        onPressed: completed
            ? () {
                ref.read(editorViewPageEncloser).showSharePage();
              }
            : null,
        child: Text(
          '완료',
          style: TextStyle(
            fontSize: 16,
            fontWeight: completed ? FontWeight.bold : FontWeight.normal,
            height: 19 / 16,
            letterSpacing: -1,
            color: completed ? clPrimaryBlack : clGray400,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
