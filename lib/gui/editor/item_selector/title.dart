import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/editor/riverpod/selected_photo_provider.dart';

class ItemSelectorTitle extends ConsumerWidget {
  const ItemSelectorTitle({
    Key? key,
    required this.itemTitle,
  }) : super(key: key);

  final String itemTitle;

  @override
  Widget build(BuildContext context, ref) {
    final selected = ref.watch(selectedImageProvider).selected ||
        ref.watch(selectedEmotionProvider).selected;
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
