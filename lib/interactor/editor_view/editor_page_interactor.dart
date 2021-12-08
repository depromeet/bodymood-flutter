import 'package:flutter/material.dart';

import '../../state/editor_view/editor_view_page_state.dart';
import '../app_view/app_view_interactor.dart';

class EditorViewPageInteractor extends ChangeNotifier {
  EditorViewPageInteractor({
    required this.appViewInteractor,
  });

  final AppViewInteractor appViewInteractor;
  EditorViewPageState state = EditorViewPageState.template();
  int template = 0;

  void closeEditor() {
    state = EditorViewPageState.template();
    appViewInteractor.showAlbumView();
  }

  void showTemplatePage() {
    _showPage(EditorViewPageState.template());
  }

  void showEditorPage([int _template = 0]) {
    template = _template;
    _showPage(EditorViewPageState.editor());
  }

  void showImagePage() {
    assert(state.maybeMap(
      editor: (_) => true,
      orElse: () => false,
    ));
    _showPage(EditorViewPageState.image());
  }

  void showExercisePage() {
    assert(state.maybeMap(
      editor: (_) => true,
      orElse: () => false,
    ));
    _showPage(EditorViewPageState.exercise());
  }

  void showMoodPage() {
    assert(state.maybeMap(
      editor: (_) => true,
      orElse: () => false,
    ));
    _showPage(EditorViewPageState.mood());
  }

  void showSharePage() {
    assert(state.maybeMap(
      editor: (_) => true,
      orElse: () => false,
    ));
    _showPage(EditorViewPageState.share());
  }

  void _showPage(EditorViewPageState newPage) {
    state = newPage;
    notifyListeners();
  }

  bool get onTemplatePage => state.maybeMap(
        share: (_) => false,
        orElse: () => true,
      );
  bool get onEditorPage => state.maybeMap(
        share: (_) => false,
        template: (_) => false,
        orElse: () => true,
      );
  bool get onImagePage => state.maybeMap(
        image: (_) => true,
        orElse: () => false,
      );
  bool get onExercisePage => state.maybeMap(
        exercise: (_) => true,
        orElse: () => false,
      );
  bool get onMoodPage => state.maybeMap(
        mood: (_) => true,
        orElse: () => false,
      );
  bool get onSharePage => state.maybeMap(
        share: (_) => true,
        orElse: () => false,
      );
}
