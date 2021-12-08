import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../interactor/preferences_view/preferences_page_interactor.dart';
import '../../state/preferences_view/preferences_view_page_state.dart';

final preferencesViewPageEncloser = ChangeNotifierProvider.autoDispose((ref) {
  return PreferencesPageEncloser();
});

class PreferencesPageEncloser extends PreferencesViewPageInteractor {
  void showMain() {
    state = const PreferencesViewPageState.main();
    notifyListeners();
  }

  void showLogout() {
    state = const PreferencesViewPageState.logout();
    notifyListeners();
  }

  void showSingOut() {
    state = const PreferencesViewPageState.signout();
    notifyListeners();
  }

  void showAgreement() {
    state = const PreferencesViewPageState.agreement();
    notifyListeners();
  }
}
