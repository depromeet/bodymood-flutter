import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routes/path.dart';
import '../widgets/appbar/appbar.dart';
import 'button/create_poster_button.dart';
import 'posters_view/empty_posters_view.dart';
import 'posters_view/grid_view.dart';

class PostersPage extends ConsumerWidget {
  const PostersPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.posters,
      key: ValueKey(BodymoodPath.posters),
      child: PostersPage(),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
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
                  child: _PostersListView(),
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

class _PostersListView extends ConsumerWidget {
  const _PostersListView({Key? key}) : super(key: key);

  final lenlen = 0;
  @override
  Widget build(BuildContext context, ref) {
    return lenlen == 0
        ? const EmptyPostersView()
        : PostersGridView(postersCount: lenlen);
  }
}
