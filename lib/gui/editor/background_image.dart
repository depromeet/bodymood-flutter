import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/editor/riverpod/selected_photo_provider.dart';
import '../../bloc/posters/core/ds/poster_store.dart';

class PosterBackgroundImage extends ConsumerWidget {
  const PosterBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final photo = ref.watch(selectedImageProvider);
    final image = _getImage(photo.image);
    return Stack(
      fit: StackFit.expand,
      children: [
        image,
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
        return Image.network(
          remote.path,
          fit: BoxFit.cover,
        );
      },
      empty: (_) {
        return Container();
      },
    );
  }
}
