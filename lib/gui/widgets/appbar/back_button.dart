import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';

class BodymoodBackButton extends ConsumerWidget {
  const BodymoodBackButton({Key? key, this.onTap, this.color = Colors.black})
      : super(key: key);

  final Function? onTap;
  final Color color;

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        Navigator.pop(context);
        onTap?.call();
      },
      child: SvgPicture.asset(
        BodymoodImages.arrowBackIcon,
        fit: BoxFit.contain,
        color: color,
      ),
    );
  }
}
