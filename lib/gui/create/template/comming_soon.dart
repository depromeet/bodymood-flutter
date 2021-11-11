import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class CommingSoonTemplate extends StatelessWidget {
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
}
