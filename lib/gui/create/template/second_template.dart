import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../encloser/editor_view/editor_view_page_encloser.dart';
import '../../../encloser/editor_view/editor_view_poster_state.dart';
import '../../../resources/resources.dart';
import 'template_base.dart';

class SecondPosterTemplate extends ConsumerWidget with TemplateBase {
  const SecondPosterTemplate({
    Key? key,
  }) : super(key: key);

  @override
  String get engTitle => 'Shoulder Day';
  @override
  String get korTitle => '숄더데이';

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
              CreatePosterImages.secondTemplate,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: () {
            ref.read(editorViewPosterEncloser).setTemplate(1);
            ref.read(editorViewPageEncloser).showEditorPage();
          },
        ),
      ),
    );
  }

  @override
  int get maxNumOfExercises => 6;
}
