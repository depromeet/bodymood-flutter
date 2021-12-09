import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';

class BodymoodBackButton extends ConsumerWidget {
  const BodymoodBackButton({
    Key? key,
    this.onTap,
    this.color = Colors.black,
  }) : super(key: key);

  final Function? onTap;
  final Color color;

  @override
  Widget build(BuildContext context, ref) {
    return Transform.translate(
      offset: const Offset(-10, 0),
      child: SizedBox(
        width: 44,
        height: 44,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            onTap?.call();
            Navigator.pop(context);
          },
          child: Center(
            child: SvgPicture.asset(
              BodymoodImages.arrowBackIcon,
              fit: BoxFit.contain,
              color: color,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
