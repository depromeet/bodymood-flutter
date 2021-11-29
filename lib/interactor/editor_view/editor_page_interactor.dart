import 'package:flutter/material.dart';

import '../../state/editor_view/editor_page_state.dart';
import '../app_view/app_view_interactor.dart';

class EditorViewPageInteractor extends ChangeNotifier {
  EditorViewPageInteractor({
    required this.appViewInteractor,
  });

  final AppViewInteractor appViewInteractor;
  EditorViewPageState state = EditorViewPageState.template();

  void closeEditor() {
    state = EditorViewPageState.template();
    appViewInteractor.showAlbumView();
  }

  void showTemplatePage() {
    _showPage(EditorViewPageState.template());
  }

  void showEditorPage() {
    _showPage(EditorViewPageState.editor());
  }

  void showImagePage() {
    _showPage(EditorViewPageState.image());
  }

  void showExercisePage() {
    _showPage(EditorViewPageState.exercise());
  }

  void showMoodPage() {
    _showPage(EditorViewPageState.mood());
  }

  void showSharePage() {
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
