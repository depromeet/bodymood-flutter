import 'package:bodymood/bloc/editor/model/poster_editor_state.dart';
import 'package:bodymood/bloc/editor/riverpod/editor_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/item_being_selected.dart';
import 'model/poster_editor_mode.dart';

final posterEditorStateManagerProvider = Provider((ref) {
  final editorState = ref.watch(editorStateProvider).state;
  return PosterEditorStateManager(
    read: ref.read,
    state: editorState,
  );
});

class PosterEditorStateManager {
  PosterEditorStateManager({
    required Reader read,
    required this.state,
  }) : _read = read;

  final Reader _read;
  final PosterEditorState state;

  void createPoster() {
    _setEditorMode(PosterEditorMode.create());
  }

  void showPreview() {
    _setEditorMode(PosterEditorMode.preview());
  }

  void clearAll() {
    _read(editorStateProvider).state = PosterEditorState(
      itemBeingSelected: ItemBeingSelected.none(),
      mode: PosterEditorMode.none(),
      posterTemplate: -1,
    );
  }

  void clearTemplate() {
    setTemplate(-1);
  }

  void setTemplate(int index) {
    _read(editorStateProvider).state = state.copyWith(
      posterTemplate: index,
    );
  }

  void selectImage() {
    _setItemBeingSelected(ImageBeingSelected());
  }

  void selectExercises() {
    _setItemBeingSelected(ExercisesBeingSelected());
  }

  void selectEmotion() {
    _setItemBeingSelected(EmotionBeingSelected());
  }

  void finishItemSelection() {
    _setItemBeingSelected(NothingBeingSelected());
  }

  void _setItemBeingSelected(ItemBeingSelected item) {
    _read(editorStateProvider).state = state.copyWith(
      itemBeingSelected: item,
    );
  }

  void _setEditorMode(PosterEditorMode mode) {
    _read(editorStateProvider).state = state.copyWith(
      mode: mode,
    );
  }

  bool get isEditingMode =>
      state.mode.maybeMap(edit: (_) => true, orElse: () => false);

  bool get isCreatingMode =>
      state.mode.maybeMap(create: (_) => true, orElse: () => false);

  bool get isPreviewMode =>
      state.mode.maybeMap(preview: (_) => true, orElse: () => false);

  bool get templateSelected => state.posterTemplate != -1;

  bool get isSelectingImage => state.itemBeingSelected.maybeMap(
        image: (_) => true,
        orElse: () => false,
      );

  bool get isSelectingExercises => state.itemBeingSelected.maybeMap(
        exercises: (_) => true,
        orElse: () => false,
      );

  bool get isSelectingEmotion => state.itemBeingSelected.maybeMap(
        emotion: (_) => true,
        orElse: () => false,
      );
}
