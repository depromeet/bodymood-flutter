import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../interactor/posters/riverpod/posters_provider.dart';
import '../widgets/appbar/appbar.dart';
import 'button/create_poster_button.dart';
import 'posters_view/empty_posters_view.dart';
import 'posters_view/grid_view.dart';

class PostersPage extends StatelessWidget {
  const PostersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                BodymoodAppbar(),
                Expanded(
                  child: PostersListView(),
                ),
              ],
            ),
            _buildCreatePosterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatePosterButton() {
    return const Positioned(
      left: 0,
      right: 0,
      bottom: 56,
      child: CreatePosterButton(),
    );
  }
}

class PostersListView extends ConsumerWidget {
  const PostersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final postersNotifier = ref.watch(postersProvider.notifier);
    final postersCount = ref.watch(postersProvider);

    return postersNotifier.isEmpty
        ? const EmptyPostersView()
        : PostersGridView(postersCount: postersCount);
  }
}
