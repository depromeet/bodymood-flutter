import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.loggedIn() = AuthLoggedInState;
  factory AuthState.loggedOut() = AuthLoggedOutState;
  factory AuthState.authorizing() = AuthAuthorizingState;
}
