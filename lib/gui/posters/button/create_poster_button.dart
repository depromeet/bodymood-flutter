import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../encloser/app_view/app_view_interactor_encloser.dart';
import '../../../resources/resources.dart';
import '../../constants/color.dart';

class CreatePosterButton extends ConsumerWidget {
  const CreatePosterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final buttonIcon = SvgPicture.asset(
      BodymoodImages.plusIcon,
      height: 24,
      color: clPrimaryWhite,
    );
    return Center(
      child: TextButton(
        onPressed: () {
          ref.read(appViewPageEncloser).showEditorView();
        },
        style: TextButton.styleFrom(
          primary: clPrimaryWhite,
          backgroundColor: clPrimaryBlack,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          elevation: 8,
          shadowColor: const Color(0xff000000).withOpacity(0.3),
        ),
        child: SizedBox(
          width: 56,
          height: 56,
          child: Center(child: buttonIcon),
        ),
      ),
    );
  }
}
