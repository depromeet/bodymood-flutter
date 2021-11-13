import '../../../bloc/editor/poster_editor_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      child: GestureDetector(
        onTap: () {
          ref.read(posterEditorStateManagerProvider).setTemplate(templateIndex);
        },
        child: Image.asset(
          CreatePosterImages.firstTemplate,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
