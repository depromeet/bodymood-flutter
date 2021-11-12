import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/poster_editor_mode.dart';

final posterEditorModeProvider = StateProvider((_) => PosterEditorMode.none());
