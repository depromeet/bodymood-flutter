import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'posters_state_notifier.dart';

final postersProvider = StateNotifierProvider<PostersStateNotifier, int>(
    (ref) => PostersStateNotifier(read: ref.read));
