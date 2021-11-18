import 'package:bodymood/bloc/preferences/model/preferences_menu.dart';
import 'package:bodymood/bloc/preferences/riverpod/preferences_menu_provider.dart';
import 'package:bodymood/bloc/preferences/riverpod/preferences_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferencesStateManager {
  PreferencesStateManager({
    required Reader read,
    required this.shouldShowPreferences,
    required this.subMenu,
  }) : _read = read;

  final Reader _read;
  final bool shouldShowPreferences;
  final PreferencesMenu subMenu;

  void showPreferences() {
    _read(showPreferencesProvider).state = true;
  }

  void closePreferences() {
    _read(showPreferencesProvider).state = false;
  }

  void closeMenu() {
    _read(preferencseMenuProvider).state = PreferencesMenu.none();
  }

  bool get agreementOpen =>
      subMenu.map(agreement: (_) => true, none: (_) => false);
}
