import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class PostersGridView extends StatelessWidget {
  const PostersGridView({
    Key? key,
    required this.postersCount,
  }) : super(key: key);

  final int postersCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 156 / 277,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
      ),
      itemCount: postersCount,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          PostersImages.posterImage,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
