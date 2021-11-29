import '../model/preferences_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final preferencseMenuProvider = StateProvider(
  (_) => PreferencesMenu.none(),
);
