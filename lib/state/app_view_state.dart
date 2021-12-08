import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_view_state.freezed.dart';

@freezed
class AppViewState with _$AppViewState {
  factory AppViewState.splash() = _SplashView;
  factory AppViewState.login() = _LoginView;
  factory AppViewState.album() = _AlbumView;
  factory AppViewState.editor() = _EditorView;
  factory AppViewState.preferences() = _PreferencesView;
}
