import 'package:bodymood/bloc/preferences/preferences_state_manager.dart';
import 'package:bodymood/bloc/preferences/riverpod/preferences_menu_provider.dart';
import 'package:bodymood/bloc/preferences/riverpod/preferences_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final preferencesManageProvider = Provider(
  (ref) {
    final shouldShowPreferences = ref.watch(showPreferencesProvider).state;
    final prefMenu = ref.watch(preferencseMenuProvider).state;
    return PreferencesStateManager(
      read: ref.read,
      subMenu: prefMenu,
      shouldShowPreferences: shouldShowPreferences,
    );
  },
);
