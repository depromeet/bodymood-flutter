import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/posters/model/poster_image.dart';
import '../../../bloc/posters/riverpod/poster_album_provider.dart';
import '../../../bloc/posters/riverpod/poster_index_provider.dart';
import '../../constants/color.dart';
import '../util/image_to_hero_tag.dart';

class PostersGridView extends ConsumerWidget {
  const PostersGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posters = ref.watch(posterAlbumProvider);
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 156 / 277,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
      ),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: posters.length + 1,
      itemBuilder: (BuildContext context, int index) {
        final image = posters[index];
        if (image == null) {
          return const SizedBox.shrink(
            key: ValueKey('empty poster'),
          );
        } else {
          return _PosterThumbnail(
            key: ValueKey(image.imageUrl),
            image: image,
            index: index,
          );
        }
      },
    );
  }
}

class _PosterThumbnail extends ConsumerWidget {
  const _PosterThumbnail({
    Key? key,
    required this.image,
    required this.index,
  }) : super(key: key);

  final PosterImage image;
  final int index;

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(posterViewIndexProvider).state = index;
      },
      child: Hero(
        tag: imageToHeroTage(image),
        child: CachedNetworkImage(
          imageUrl: image.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, _) {
            return Container(
              color: (((index + 1) ~/ 2) % 2) == 0 ? clGray200 : clGray100,
            );
          },
        ),
      ),
    );
  }
}
