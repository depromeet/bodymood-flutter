import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_page_encloser.dart';
import '../../../resources/resources.dart';

class FirstPosterTemplate extends ConsumerWidget {
  const FirstPosterTemplate({
    Key? key,
    this.templateIndex = 0,
  }) : super(key: key);

  final int templateIndex;

  @override
  Widget build(BuildContext context, ref) {
    return AspectRatio(
      aspectRatio: 310 / 550,
      child: Ink.image(
        image: const AssetImage(
          CreatePosterImages.firstTemplate,
        ),
        fit: BoxFit.cover,
        child: InkWell(
          onTap: () {
            ref.read(editorViewPageEncloser).showEditorPage();
          },
        ),
      ),
    );
  }
}
