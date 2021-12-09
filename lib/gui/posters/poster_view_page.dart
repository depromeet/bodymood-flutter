import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/posters/model/poster_image.dart';
import '../../bloc/posters/riverpod/poster_album_provider.dart';
import '../constants/color.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import 'button/poster_delete_button.dart';
import 'button/poster_share_button.dart';
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
              child: _buildMainImage(poster),
            ),
            const SizedBox(height: 57),
            Container(
              height: 56,
              decoration: const BoxDecoration(
                color: clPrimaryBlack,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PosterDeleteButton(posterId: poster.id),
                  const SizedBox(width: 80),
                  PosterShareButton(poster: poster),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildMainImage(PosterImage poster) {
    return Padding(
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
