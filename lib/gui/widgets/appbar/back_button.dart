import '../../../interactor/route/riverpod/path_provider.dart';
import '../../../interactor/route/riverpod/route_path_setting.dart';
import '../../../resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class BodymoodBackButton extends ConsumerWidget {
  const BodymoodBackButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function? onTap;

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        final route = ref.read(currentPathProvider.notifier);
        onTap?.call();
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        BodymoodImages.arrowBackIcon,
        fit: BoxFit.contain,
      ),
    );
  }
}
