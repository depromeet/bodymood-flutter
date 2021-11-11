import 'riverpod/path_provider.dart';
import 'riverpod/route_path_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteInteractor extends ConsumerWidget {
  const RouteInteractor(
      {Key? key, required this.child, required this.navigatorKey})
      : super(key: key);
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<BodymoodRouteSetting>(
      currentPathProvider,
      (setting) {
        final nav = navigatorKey.currentState;
        if (setting.reset) {
          nav?.pushNamedAndRemoveUntil(setting.path, (route) => false);
        } else if (setting.pop) {
          nav?.pop();
        } else if (setting.replace) {
          nav?.pushReplacementNamed(setting.path);
        } else {
          nav?.pushNamed(setting.path);
        }
      },
    );
    return child;
  }
}
