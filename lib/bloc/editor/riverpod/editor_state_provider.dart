import '../model/item_being_selected.dart';
import '../model/poster_editor_mode.dart';
import '../model/poster_editor_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final editorStateProvider = StateProvider<PosterEditorState>(
  (ref) => PosterEditorState(
    posterTemplate: -1,
    mode: PosterEditorMode.none(),
    itemBeingSelected: ItemBeingSelected.none(),
  ),
);
