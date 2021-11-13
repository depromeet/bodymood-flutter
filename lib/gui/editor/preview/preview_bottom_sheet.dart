import 'package:bodymood/bloc/editor/riverpod/poster_path_provider.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class PreviewBottomSheet extends StatelessWidget {
  const PreviewBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: clPrimaryWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _GotoHomeButton(),
          SizedBox(width: 80),
          _SharePosterButton(),
        ],
      ),
    );
  }
}

class _GotoHomeButton extends StatelessWidget {
  const _GotoHomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        EditPosterImages.iconViewAlbum,
        height: 28,
      ),
    );
  }
}

class _SharePosterButton extends ConsumerWidget {
  const _SharePosterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posterPath = ref.watch(posterPathProvider).state;
    return GestureDetector(
      onTap: () async {
        await Share.shareFiles([posterPath]);
      },
      child: SvgPicture.asset(
        EditPosterImages.iconShare,
        height: 28,
      ),
    );
  }
}
