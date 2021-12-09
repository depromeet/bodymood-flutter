import 'dart:io';

import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../bloc/posters/model/poster_image.dart';
import '../../../resources/resources.dart';
import '../../constants/color.dart';
import '../util/image_to_network_file.dart';

class PosterShareButton extends ConsumerWidget {
  const PosterShareButton({
    Key? key,
    required this.poster,
  }) : super(key: key);

  final PosterImage poster;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final path = await getImageTempFilePath(poster);
          final file = File(path);
          if (await file.exists()) {
            await Share.shareFiles([path]);
          } else {
            final utils = DownloaderUtils(
              progress: ProgressImplementation(),
              file: file,
              onDone: () async {
                await Share.shareFiles([path]);
              },
              progressCallback: (current, total) {},
            );
            await Flowder.download(poster.imageUrl, utils);
          }
        },
        child: SizedBox(
          width: 56,
          child: Center(
            child: SvgPicture.asset(
              EditPosterImages.iconShare,
              color: clPrimaryWhite,
              height: 28,
            ),
          ),
        ),
      ),
    );
  }
}
