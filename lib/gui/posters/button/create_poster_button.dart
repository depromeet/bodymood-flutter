import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../interactor/posters/riverpod/posters_provider.dart';
import '../../../resources/resources.dart';
import '../../constants/color.dart';

class CreatePosterButton extends ConsumerWidget {
  const CreatePosterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final buttonBoxDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: clPrimaryBlack,
      boxShadow: [
        BoxShadow(
          blurRadius: 8,
          offset: const Offset(0, 4),
          color: const Color(0xff000000).withOpacity(0.3),
        ),
      ],
    );
    final buttonIcon = SvgPicture.asset(
      BodymoodImages.plusIcon,
      height: 24,
    );
    return Center(
      child: Container(
        width: 56,
        height: 56,
        decoration: buttonBoxDecoration,
        child: TextButton(
          onPressed: () {
            ref.read(postersProvider.notifier).addPoster();
          },
          style: TextButton.styleFrom(
            shape: const CircleBorder(),
          ),
          child: buttonIcon,
        ),
      ),
    );
  }
}
