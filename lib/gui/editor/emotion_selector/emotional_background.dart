import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_poster_state.dart';
import 'util/emotion_to_gradient.dart';

class EmotionalBackground extends ConsumerWidget {
  const EmotionalBackground({
    Key? key,
    this.child,
    this.opacity = 1.0,
    this.onlySelected = false,
  }) : super(key: key);

  final Widget? child;
  final double opacity;
  final bool onlySelected;

  @override
  Widget build(BuildContext context, ref) {
    final selectedEmotion = ref.watch(editorViewPosterEncloser).mood;
    final gradient = selectedEmotion.map<Gradient>(
      empty: (_) => LinearGradient(
        colors: [
          const Color(0xffc1c1c1).withOpacity(onlySelected ? 0 : opacity),
          const Color(0xff979797).withOpacity(onlySelected ? 0 : opacity),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      selected: (selected) =>
          emotionToLinearGradient(selected.emotion, opacity),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: child,
    );
  }
}
