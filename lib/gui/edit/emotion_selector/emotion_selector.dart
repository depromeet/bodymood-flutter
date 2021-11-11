import '../../../bloc/posters/core/ds/emotion.dart';
import '../../constants/color.dart';
import 'riverpod/emotions.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmotionSelectorPage extends ConsumerWidget {
  const EmotionSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final emotions = ref.watch(emotionsProvider);
    final body = _buildBody(emotions);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BodymoodAppbar(
              leading: BodymoodBackButton(),
            ),
            body,
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
          children: [],
        ),
      );
    }, error: (_) {
      return Text('serverError');
    }, loading: (_) {
      return const Center(
        child: RefreshProgressIndicator(
          color: clPrimaryBlack,
        ),
      );
    });
  }
}
