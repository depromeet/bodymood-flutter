import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';

class ItemSelectorTitle extends ConsumerWidget {
  const ItemSelectorTitle({
    Key? key,
    required this.itemTitle,
  }) : super(key: key);

  final String itemTitle;

  @override
  Widget build(BuildContext context, ref) {
    final posterState = ref.watch(editorViewPosterEncloser);
    final selected = posterState.isImageSelected || posterState.isMoodSelected;
    return Text(
      itemTitle,
      style: TextStyle(
        fontSize: 16,
        height: 19 / 16,
        color: selected ? Colors.white : const Color.fromRGBO(80, 80, 80, 0.7),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
