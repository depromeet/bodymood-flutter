import '../../../bloc/editor/poster_editor_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/color.dart';
import '../riverpod/all_provider.dart';

class CompletePosterEditingButton extends ConsumerWidget {
  const CompletePosterEditingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final completed = ref.watch(posterItemsProvider.notifier).selectedAll;
    return TextButton(
      onPressed: completed
          ? () {
              ref.read(posterEditorStateManagerProvider).showPreview();
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
      ),
    );
  }
}
