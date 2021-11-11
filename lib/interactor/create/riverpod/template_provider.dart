import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'template_notifier.dart';

final posterTemplateProvider =
    StateNotifierProvider<PosterTemplateNotifier, IntClass>(
  (_) => PosterTemplateNotifier(0),
);
