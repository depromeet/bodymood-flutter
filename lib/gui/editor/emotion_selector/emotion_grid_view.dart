import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/editor/model/emotion.dart';
import '../../../bloc/editor/riverpod/emotions_provider.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../constants/color.dart';
import 'emotion_selector_item.dart';
import 'emotional_background.dart';

class EmotionGridView extends ConsumerWidget {
  const EmotionGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final selectedEmotion = ref.watch(editorViewPosterEncloser).mood;
    final emotions = ref.watch(emotionsProvider);
    final isEmotionSelected =
        selectedEmotion.map(empty: (_) => false, selected: (_) => true);
    final body = emotions.map(
      data: (data) {
        final emotionsData = data.value;
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              _buildTopArea(isEmotionSelected),
              const SizedBox(height: 44),
              _buildGridArea(emotionsData),
            ],
          ),
        );
      },
      error: _buildOnError,
      loading: _buildOnLoading,
    );

    return EmotionalBackground(
      child: body,
    );
  }

  GridView _buildGridArea(List<BodymoodEmotion> emotionsData) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 76 / 94,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 36),
      shrinkWrap: true,
      itemCount: emotionsData.length,
      itemBuilder: (context, index) {
        final emotion = emotionsData[index];
        return EmotionSelectorItem(emotion: emotion);
      },
    );
  }

  SizedBox _buildTopArea(bool isEmotionSelected) {
    return SizedBox(
      height: 54,
      child: isEmotionSelected
          ? const SizedBox.shrink()
          : _buildEmotionSelectorTitle(),
    );
  }

  Widget _buildEmotionSelectorTitle() {
    return const FittedBox(
      child: Text(
        '오늘은 어떤 색상의\n감정을 느끼셨나요?',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 1.5,
          color: clPrimaryWhite,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOnError(_) {
    return const Text('serverError');
  }

  Widget _buildOnLoading(_) {
    return const Center(
      child: RefreshProgressIndicator(
        color: clPrimaryBlack,
      ),
    );
  }
}
