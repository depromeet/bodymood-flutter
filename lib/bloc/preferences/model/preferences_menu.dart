import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_menu.freezed.dart';

@freezed
class PreferencesMenu with _$PreferencesMenu {
  factory PreferencesMenu.agreement() = PreferencesUserAgreement;
  factory PreferencesMenu.none() = PreferencesNone;
}
