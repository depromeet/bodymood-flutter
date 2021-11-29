import 'package:freezed_annotation/freezed_annotation.dart';

part 'editor_page_state.freezed.dart';

@freezed
class EditorViewPageState with _$EditorViewPageState {
  factory EditorViewPageState.template() = _TemplatePage;
  factory EditorViewPageState.editor() = _EditorPage;
  factory EditorViewPageState.image() = _ImagePage;
  factory EditorViewPageState.exercise() = _ExercisePage;
  factory EditorViewPageState.mood() = _MoodPage;
  factory EditorViewPageState.share() = _SharePage;
}
