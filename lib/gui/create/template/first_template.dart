import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_page_encloser.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../../resources/resources.dart';
import 'template_base.dart';

class FirstPosterTemplate extends ConsumerWidget with TemplateBase {
  const FirstPosterTemplate({
    Key? key,
  }) : super(key: key);

  @override
  String get engTitle => 'Serif';
  @override
  String get korTitle => '세리프';

  @override
  Widget build(BuildContext context, ref) {
    return Material(
      child: Ink(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(
              CreatePosterImages.firstTemplate,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: () {
            ref.read(editorViewPosterEncloser).setTemplate(0);
            ref.read(editorViewPageEncloser).showEditorPage();
          },
        ),
      ),
    );
  }

  @override
  int get maxNumOfExercises => 3;
}
