import 'model/poster_editor_mode.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final _posterEditorModeProvider = StateProvider((_) => PosterEditorMode.none());

final posterEditorStateManagerProvider = Provider((ref) {
  final editorMode = ref.watch(_posterEditorModeProvider).state;
  return PosterEditorStateManager(read: ref.read, mode: editorMode);
});

class PosterEditorStateManager {
  PosterEditorStateManager(
      {required Reader read, required PosterEditorMode mode})
      : _read = read,
        _mode = mode;

  final Reader _read;
  final PosterEditorMode _mode;

  void createPoster() {
    _setEditorMode(PosterEditorMode.create());
  }

  void clear() {
    _setEditorMode(PosterEditorMode.none());
  }

  _setEditorMode(PosterEditorMode mode) {
    _read(_posterEditorModeProvider).state = mode;
  }

  bool get isEditing => _mode.maybeMap(edit: (_) => true, orElse: () => false);
  bool get isCreating =>
      _mode.maybeMap(create: (_) => true, orElse: () => false);
}
