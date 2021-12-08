import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/posters/model/poster_image.dart';
import '../../constants/color.dart';
import '../poster_view_page.dart';
import '../util/image_to_hero_tag.dart';

class PosterThumbnail extends ConsumerWidget {
  const PosterThumbnail({
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
        showDialog(
          context: context,
          builder: (context) {
            return PosterViewPage(index: index);
          },
        );
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
