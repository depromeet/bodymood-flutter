import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/posters/riverpod/poster_album_provider.dart';
import '../../encloser/app_view/app_view_interactor_encloser.dart';
import '../../resources/resources.dart';
import '../../routes/path.dart';
import '../constants/color.dart';
import '../widgets/appbar/appbar.dart';
import 'button/create_poster_button.dart';
import 'posters_view/empty_posters_view.dart';
import 'posters_view/grid_view.dart';
import 'tooltip/create_tooltip.dart';

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
                  tail: Transform.translate(
                    offset: const Offset(4, 0),
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: TextButton(
                        onPressed: () {
                          ref.read(appViewPageEncloser).showPreferencesView();
                        },
                        child: SvgPicture.asset(
                          PostersImages.iconPerson,
                          height: 24,
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: _PostersListView(),
                ),
              ],
            ),
            _buildTooltip(),
            _buildFloatingCreatePosterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTooltip() {
    return const Positioned(
      bottom: 148,
      left: 0,
      right: 0,
      child: CreateTooltip(),
    );
  }

  Widget _buildFloatingCreatePosterButton() {
    return const Positioned(
      left: 0,
      right: 0,
      bottom: 56,
      child: CreatePosterButton(),
    );
  }
}

class _PostersListView extends ConsumerStatefulWidget {
  const _PostersListView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostersListViewState();
}

class _PostersListViewState extends ConsumerState<_PostersListView> {
  @override
  void initState() {
    super.initState();
    ref.read(posterAlbumProvider.notifier).refresh();
  }

  @override
  void didUpdateWidget(covariant _PostersListView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final posters = ref.watch(posterAlbumProvider);
    return RefreshIndicator(
      key: const ValueKey('album view pull to refresh module'),
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
