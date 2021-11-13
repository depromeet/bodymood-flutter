import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';

class BodymoodAppbar extends StatelessWidget {
  const BodymoodAppbar({
    Key? key,
    this.title,
    this.leading,
    this.tail,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final Widget? tail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: leading ?? const SizedBox.shrink(),
            ),
            Center(
              child: title ??
                  SvgPicture.asset(
                    BodymoodImages.bodymoodTitle,
                    height: 22,
                  ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: tail ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
