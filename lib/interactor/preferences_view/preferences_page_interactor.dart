import 'package:flutter/material.dart';

import '../../state/preferences_view/preferences_view_page_state.dart';
import '../../state/util/boolean_mapper.dart';

class PreferencesViewPageInteractor extends ChangeNotifier {
  PreferencesViewPageState state = const PreferencesViewPageState.main();

  bool get onMain => true;
  bool get onLogout => state.maybeMap(
        logout: mapToTrue,
        orElse: mapToFalse,
      );
  bool get onSingOut => state.maybeMap(
        signout: mapToTrue,
        orElse: mapToFalse,
      );
  bool get onAgreement => state.maybeMap(
        agreement: mapToTrue,
        orElse: mapToFalse,
      );
}
