import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../bloc/editor/riverpod/poster_path_provider.dart';
import '../../../resources/resources.dart';
import '../../constants/color.dart';

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
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          EditPosterImages.iconViewAlbum,
          height: 28,
        ),
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
    return Material(
      child: InkWell(
        onTap: () async {
          await Share.shareFiles([posterPath]);
        },
        child: SvgPicture.asset(
          EditPosterImages.iconShare,
          height: 28,
        ),
      ),
    );
  }
}
