import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/path.dart';
import '../../route/riverpod/path_provider.dart';
import '../../route/riverpod/route_path_setting.dart';

class PostersStateNotifier extends StateNotifier<int> {
  PostersStateNotifier({required this.read}) : super(0);

  final Reader read;

  createPoster() {
    final route = read(currentPathProvider.notifier);
    route.updatePath(
      BodymoodRouteSetting(path: BodymoodPath.create),
    );
  }

  addPoster() {
    state++;
  }

  removePoster() {
    state--;
  }

  int get numPosters => state;
  bool get isEmpty => numPosters == 0;
  bool get isNotEmpty => numPosters != 0;
}
