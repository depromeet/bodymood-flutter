import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/posters/riverpod/poster_album_provider.dart';
import 'poster_thumbnail.dart';

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
          return PosterThumbnail(
            key: ValueKey(image.imageUrl),
            image: image,
            index: index,
          );
        }
      },
    );
  }
}
