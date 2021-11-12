import 'package:flutter/material.dart';

import 'item_editor.dart';
import 'poster_preview.dart';

class EditablePosterArea extends StatelessWidget {
  const EditablePosterArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const editablePosterBoxDecoration = BoxDecoration(
      color: Color(0xfff7f7f7),
    );
    const editablePosterBoxPadding = EdgeInsets.symmetric(
      horizontal: 38,
      vertical: 44,
    );
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 82),
      decoration: editablePosterBoxDecoration,
      child: AspectRatio(
        aspectRatio: 327 / 580,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const PosterPreview(),
            Container(
              padding: editablePosterBoxPadding,
              child: const ItemSelector(),
            ),
          ],
        ),
      ),
    );
  }
}
