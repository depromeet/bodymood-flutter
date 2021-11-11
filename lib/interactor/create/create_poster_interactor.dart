import 'riverpod/template_notifier.dart';
import 'riverpod/template_provider.dart';
import '../route/riverpod/path_provider.dart';
import '../route/riverpod/route_path_setting.dart';
import '../../routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePosterInteractor extends ConsumerWidget {
  const CreatePosterInteractor({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<IntClass>(
      posterTemplateProvider,
      (idx) {
        final route = ref.read(currentPathProvider.notifier);
        route.updatePath(
          BodymoodRouteSetting(
            path: BodymoodPath.edit,
          ),
        );
      },
    );
    return child;
  }
}
