import 'package:flutter/material.dart';

import '../../../resources/resources.dart';
import 'template_base.dart';

class CommingSoonTemplate extends StatelessWidget with TemplateBase {
  const CommingSoonTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 310 / 550,
      child: Image.asset(
        CreatePosterImages.commingSoon,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  String get engTitle => 'Comming';

  @override
  String get korTitle => '준비중';

  @override
  int get maxNumOfExercises => 0;
}
