import 'package:bodymood/bloc/editor/model/item_being_selected.dart';
import 'package:bodymood/bloc/editor/model/poster_editor_mode.dart';
import 'package:bodymood/bloc/editor/model/poster_editor_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final editorStateProvider = StateProvider<PosterEditorState>(
  (ref) => PosterEditorState(
    posterTemplate: -1,
    mode: PosterEditorMode.none(),
    itemBeingSelected: ItemBeingSelected.none(),
  ),
);
