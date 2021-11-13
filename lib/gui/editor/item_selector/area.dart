import 'package:bodymood/bloc/editor/base/seletable_item_notifier.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosterItemSelectorArea extends ConsumerWidget {
  const PosterItemSelectorArea({
    Key? key,
    this.child,
    required this.provider,
  }) : super(key: key);

  final Widget? child;
  final ChangeNotifierProvider<PosterItemsNotifier> provider;

  @override
  Widget build(BuildContext context, ref) {
    final selected = ref.watch(provider).selected;
    return AspectRatio(
      aspectRatio: 250 / 140,
      child: DottedBorder(
        color: const Color.fromRGBO(80, 80, 80, 0.5),
        strokeWidth: 1,
        padding: EdgeInsets.zero,
        radius: const Radius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            color: selected
                ? Colors.transparent
                : const Color.fromRGBO(80, 80, 80, 0.1),
            borderRadius: BorderRadius.circular(2),
          ),
          child: child,
        ),
      ),
    );
  }
}
