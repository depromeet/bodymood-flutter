import 'route_path_setting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPathProvider =
    StateNotifierProvider<RoutePathSettingNotifier, BodymoodRouteSetting>(
  (_) => RoutePathSettingNotifier(
    BodymoodRouteSetting(
      path: '/',
    ),
  ),
);

class RoutePathSettingNotifier extends StateNotifier<BodymoodRouteSetting> {
  RoutePathSettingNotifier(state) : super(state);

  updatePath(BodymoodRouteSetting setting) {
    state = setting;
  }

  BodymoodRouteSetting get setting => state;
}
