import '../../../bloc/posters/core/ds/poster_store.dart';
import '../../edit/riverpod/photo_provider.dart';
import '../../../interactor/create/riverpod/template_provider.dart';
import '../../../resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstPosterTemplate extends ConsumerWidget {
  const FirstPosterTemplate({
    Key? key,
    int templateIndex = 0,
  })  : _index = templateIndex,
        super(key: key);

  final int _index;

  @override
  Widget build(BuildContext context, ref) {
    return AspectRatio(
      aspectRatio: 310 / 550,
      child: InkWell(
        onTap: () {
          final templateProvider = ref.read(posterTemplateProvider.notifier);

          // clear image selected before;
          ref
              .read(selectedPhotoProvider.notifier)
              .updatePhoto(EmptyImageStore());

          templateProvider.select(_index);
        },
        child: Image.asset(
          CreatePosterImages.firstTemplate,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
