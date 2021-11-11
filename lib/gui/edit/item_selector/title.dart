import '../riverpod/all_provider.dart';
import '../riverpod/photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemSelectorTitle extends ConsumerWidget {
  const ItemSelectorTitle({
    Key? key,
    required this.itemTitle,
  }) : super(key: key);

  final String itemTitle;

  @override
  Widget build(BuildContext context, ref) {
    final photo = ref.watch(selectedPhotoProvider);
    return Text(
      itemTitle,
      style: TextStyle(
        fontSize: 16,
        height: 19 / 16,
        color: photo.image.maybeMap(
          empty: (_) => const Color.fromRGBO(80, 80, 80, 0.7),
          orElse: () => Colors.white,
        ),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
