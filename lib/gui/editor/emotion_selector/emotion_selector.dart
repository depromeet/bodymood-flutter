import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/editor/model/emotion.dart';
import '../../../bloc/editor/riverpod/emotions_provider.dart';
import '../../../routes/path.dart';
import '../../constants/color.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';

class EmotionSelectorPage extends ConsumerWidget {
  const EmotionSelectorPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.selectEmotion,
      key: ValueKey(BodymoodPath.selectEmotion),
      child: EmotionSelectorPage(),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final emotions = ref.watch(emotionsProvider);
    final body = _buildBody(emotions);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            BodymoodAppbar(
              leading: BodymoodBackButton(),
            ),
            // body,
          ],
        ),
      ),
    );
  }

  Widget _buildBody(AsyncValue<List<BodymoodEmotion>> emotions) {
    return emotions.map(data: (data) {
      return Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1 / 1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 36),
          children: const [],
        ),
      );
    }, error: (_) {
      return const Text('serverError');
    }, loading: (_) {
      return const Center(
        child: RefreshProgressIndicator(
          color: clPrimaryBlack,
        ),
      );
    });
  }
}
