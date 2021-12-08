import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class PosterItemSelectorArea extends StatelessWidget {
  const PosterItemSelectorArea({
    Key? key,
    this.child,
    this.selected = false,
  }) : super(key: key);

  final Widget? child;
  final bool selected;

  @override
  Widget build(BuildContext context) {
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
