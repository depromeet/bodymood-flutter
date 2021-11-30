import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/posters/core/ds/poster_store.dart';
import '../../encloser/editor_view/editor_view_poster_state.dart';

class PosterBackgroundImage extends ConsumerWidget {
  const PosterBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final image = ref.watch(editorViewPosterEncloser).image;
    final imageWidget = _getImage(image);
    return Stack(
      fit: StackFit.expand,
      children: [
        imageWidget,
      ],
    );
  }

  Widget _getImage(ImageStore photo) {
    return photo.map(
      local: (local) {
        final file = File(local.path);
        return Image.file(
          file,
          fit: BoxFit.cover,
        );
      },
      remote: (remote) {
        return CachedNetworkImage(
          imageUrl: remote.path,
          fit: BoxFit.cover,
        );
      },
      empty: (_) {
        return Container();
      },
    );
  }
}
