import 'package:bodymood/bloc/preferences/riverpod/preferences_manager_provider.dart';
import 'package:bodymood/routes/preferencse_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferencesPageRouter extends ConsumerWidget {
  const PreferencesPageRouter({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      child: PreferencesPageRouter(),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final prefManager = ref.watch(preferencesManageProvider);
    final prefRouter = PreferencesRouter(prefManager: prefManager);

    return Router(
      routerDelegate: prefRouter,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
