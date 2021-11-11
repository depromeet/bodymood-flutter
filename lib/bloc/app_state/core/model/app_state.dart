import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState.initialized() = AppStateInitialized;
  factory AppState.initializing() = AppStateLoading;
  factory AppState.none() = AppStateNone;
}
