import 'package:bodymood/bloc/editor/riverpod/emotions_provider.dart';
import 'package:bodymood/bloc/editor/riverpod/selected_emotion_provider.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/editor/emotion_selector/emotion_selector_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef EmotionBackgroundBuilder = Widget Function(
    BuildContext context, Widget child);

class EmotionGridView extends ConsumerWidget {
  const EmotionGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final selectedEmotion = ref.watch(selectedEmotionProvider).emotion;
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
              isEmotionSelected
                  ? const SizedBox.shrink()
                  : _buildEmotionSelectorTitle(),
              SizedBox(height: isEmotionSelected ? 0 : 44),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 76 / 94,
                  mainAxisSpacing: 24,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 36),
                shrinkWrap: true,
                itemCount: emotionsData.length,
                itemBuilder: (context, index) {
                  final emotion = emotionsData[index];
                  return EmotionSelectorItem(emotion: emotion);
                },
              ),
            ],
          ),
        );
      },
      error: _buildOnError,
      loading: _buildOnLoading,
    );
    final backgroundBuilder = selectedEmotion.map<EmotionBackgroundBuilder>(
      empty: (_) {
        return (_, child) => child;
      },
      selected: (selected) {
        final startColor = Color(
            int.parse(selected.emotion.startColor.replaceAll('#', '0xff')));
        final endColor =
            Color(int.parse(selected.emotion.endColor.replaceAll('#', '0xff')));
        return (_, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    startColor,
                    endColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: child,
            );
      },
    );
    return backgroundBuilder(context, body);
  }

  Text _buildEmotionSelectorTitle() {
    return const Text(
      '오늘은 어떤 색상의\n감정을 느끼셨나요?',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 1.5,
        color: clPrimaryWhite,
      ),
      textAlign: TextAlign.center,
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
