import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_view_page_state.freezed.dart';

@freezed
class PreferencesViewPageState with _$PreferencesViewPageState {
  const factory PreferencesViewPageState.main() = _PreferencesMainPage;
  const factory PreferencesViewPageState.logout() = _LogoutPage;
  const factory PreferencesViewPageState.agreement() = _AgreementPage;
  const factory PreferencesViewPageState.signout() = _SignoutPage;
}
