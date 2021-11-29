import 'item_being_selected.dart';
import 'poster_editor_mode.dart';

class PosterEditorState {
  final PosterEditorMode mode;
  final ItemBeingSelected itemBeingSelected;
  final int posterTemplate;

  PosterEditorState({
    required this.mode,
    required this.itemBeingSelected,
    required this.posterTemplate,
  });

  PosterEditorState copyWith({
    PosterEditorMode? mode,
    ItemBeingSelected? itemBeingSelected,
    int? posterTemplate,
  }) {
    return PosterEditorState(
      mode: mode ?? this.mode,
      itemBeingSelected: itemBeingSelected ?? this.itemBeingSelected,
      posterTemplate: posterTemplate ?? this.posterTemplate,
    );
  }
}
