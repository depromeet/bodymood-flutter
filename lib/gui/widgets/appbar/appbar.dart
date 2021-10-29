import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';

class BodymoodAppbar extends StatelessWidget {
  const BodymoodAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Center(
        child: SvgPicture.asset(
          BodymoodImages.bodymoodTitle,
          height: 22,
        ),
      ),
    );
  }
}
