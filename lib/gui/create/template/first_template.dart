import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../resources/resources.dart';

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
        onTap: () {},
        child: Image.asset(
          CreatePosterImages.firstTemplate,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
