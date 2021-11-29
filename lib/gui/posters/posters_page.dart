import '../../bloc/posters/riverpod/poster_album_provider.dart';
import '../../bloc/preferences/riverpod/preferences_manager_provider.dart';
import '../../bloc/preferences/riverpod/preferences_state_provider.dart';
import '../constants/color.dart';
import '../../resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/path.dart';
import '../widgets/appbar/appbar.dart';
import 'button/create_poster_button.dart';
import 'posters_view/empty_posters_view.dart';
import 'posters_view/grid_view.dart';

class AlbumPage extends ConsumerWidget {
  const AlbumPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.posters,
      key: ValueKey(BodymoodPath.posters),
      child: AlbumPage(),
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
              children: [
                BodymoodAppbar(
                  tail: GestureDetector(
                    onTap: () {
                      ref.read(showPreferencesProvider).state = true;
                    },
                    child: SvgPicture.asset(
                      PostersImages.iconPerson,
                      height: 24,
                    ),
                  ),
                ),
                const Expanded(
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

  @override
  Widget build(BuildContext context, ref) {
    final posters = ref.watch(posterAlbumProvider);
    return RefreshIndicator(
      onRefresh: () async {
        final album = ref.read(posterAlbumProvider.notifier);
        await album.refresh();
      },
      backgroundColor: clPrimaryWhite,
      color: clPrimaryBlack,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child:
          posters.isEmpty ? const EmptyPostersView() : const PostersGridView(),
    );
  }
}
