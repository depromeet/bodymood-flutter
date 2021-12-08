import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../bloc/posters/riverpod/poster_album_provider.dart';
import '../../resources/resources.dart';
import '../constants/color.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import 'util/image_to_hero_tag.dart';
import 'util/image_to_network_file.dart';

class PosterViewPage extends ConsumerWidget {
  const PosterViewPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, ref) {
    final poster = ref.read(posterAlbumProvider)[index]!;
    final date = getImageDateString(poster);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(date),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Hero(
                  tag: imageToHeroTage(poster),
                  child: AspectRatio(
                    aspectRatio: 327 / 581,
                    child: CachedNetworkImage(
                      imageUrl: poster.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, _) {
                        return Container(
                          color: clGray200,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 57),
            GestureDetector(
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
              child: Container(
                height: 56,
                decoration: const BoxDecoration(
                  color: clPrimaryBlack,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    EditPosterImages.iconShare,
                    color: clPrimaryWhite,
                    height: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BodymoodAppbar _buildAppBar(String date) {
    return BodymoodAppbar(
      leading: const BodymoodBackButton(
        color: clPrimaryBlack,
      ),
      title: Text(
        date,
        style: const TextStyle(
          fontSize: 16,
          height: 19 / 16,
          color: clPrimaryBlack,
        ),
      ),
    );
  }
}
