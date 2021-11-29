import 'model/preferences_menu.dart';
import 'riverpod/preferences_menu_provider.dart';
import 'riverpod/preferences_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferencesStateManager {
  PreferencesStateManager({
    required Reader read,
    required this.showPreferences,
    required this.subMenu,
  }) : _read = read;

  final Reader _read;
  final bool showPreferences;
  final PreferencesMenu subMenu;

  void closePreferences() {
    _read(showPreferencesProvider).state = false;
  }

  void closeMenu() {
    _read(preferencseMenuProvider).state = PreferencesMenu.none();
  }

  bool get agreementOpen =>
      subMenu.map(agreement: (_) => true, none: (_) => false);
}
