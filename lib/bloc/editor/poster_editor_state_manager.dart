import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/item_being_selected.dart';
import 'model/poster_editor_mode.dart';
import 'riverpod/editor_mode_provider.dart';
import 'riverpod/item_being_selected_provider.dart';
import 'riverpod/selected_template_provider.dart';

final posterEditorStateManagerProvider = Provider((ref) {
  final editorMode = ref.watch(posterEditorModeProvider).state;
  final selectedTamplate = ref.watch(selectedTemplateProvider).state;
  final itemBeingSelected = ref.watch(itemBeingSelectedProvider).state;
  return PosterEditorStateManager(
    read: ref.read,
    mode: editorMode,
    selectedTemplate: selectedTamplate,
    itemBeingSelected: itemBeingSelected,
  );
});

class PosterEditorStateManager {
  PosterEditorStateManager({
    required Reader read,
    required this.mode,
    required this.selectedTemplate,
    required this.itemBeingSelected,
  }) : _read = read;

  final Reader _read;
  final PosterEditorMode mode;
  final int selectedTemplate;
  final ItemBeingSelected itemBeingSelected;

  void createPoster() {
    _setEditorMode(PosterEditorMode.create());
  }

  void clearAll() {
    _setEditorMode(PosterEditorMode.none());
    _setItemBeingSelected(NothingBeingSelected());
    clearTemplate();
  }

  void clearTemplate() {
    setTemplate(-1);
  }

  void setTemplate(int index) {
    _read(selectedTemplateProvider).state = index;
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
    _read(itemBeingSelectedProvider).state = item;
  }

  void _setEditorMode(PosterEditorMode mode) {
    _read(posterEditorModeProvider).state = mode;
  }

  bool get isEditing => mode.maybeMap(edit: (_) => true, orElse: () => false);
  bool get isCreating =>
      mode.maybeMap(create: (_) => true, orElse: () => false);
  bool get isSelectingImage => itemBeingSelected.maybeMap(
        image: (_) => true,
        orElse: () => false,
      );
  bool get isSelectingExercises => itemBeingSelected.maybeMap(
        exercises: (_) => true,
        orElse: () => false,
      );

  bool get isSelectingEmotion => itemBeingSelected.maybeMap(
        emotion: (_) => true,
        orElse: () => false,
      );
}
