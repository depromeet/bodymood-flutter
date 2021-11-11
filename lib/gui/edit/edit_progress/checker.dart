import '../../constants/color.dart';
import '../riverpod/seletable_item_notifier.dart';
import '../../../resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class EditProgressChecker extends ConsumerWidget {
  const EditProgressChecker({
    Key? key,
    required this.title,
    required this.provider,
  }) : super(key: key);

  final String title;
  final ChangeNotifierProvider<PosterItemsNotifier> provider;

  @override
  Widget build(BuildContext context, ref) {
    final selected = ref.watch(provider).selected;
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
