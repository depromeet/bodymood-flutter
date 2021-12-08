import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';
import '../../constants/color.dart';

class EditProgressChecker extends ConsumerWidget {
  const EditProgressChecker({
    Key? key,
    required this.title,
    required this.selected,
  }) : super(key: key);

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          selected
              ? EditPosterImages.checkIconEnabled
              : EditPosterImages.checkIconDisabled,
          height: 17,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            height: 17 / 14,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? clPrimaryBlack : clGray400,
          ),
        ),
      ],
    );
  }
}
