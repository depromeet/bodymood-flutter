import 'package:freezed_annotation/freezed_annotation.dart';

part 'poster_editor_mode.freezed.dart';

@freezed
class PosterEditorMode with _$PosterEditorMode {
  factory PosterEditorMode.edit() = PosterEditorEdit;
  factory PosterEditorMode.create() = PosterEditorCreate;
  factory PosterEditorMode.none() = PosterEditorNone;
}
