import 'dart:io';

import '../../bloc/posters/core/ds/poster_store.dart';
import 'riverpod/photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosterPreview extends ConsumerWidget {
  const PosterPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final photo = ref.watch(selectedPhotoProvider);
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
