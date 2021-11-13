import 'package:bodymood/bloc/posters/riverpod/poster_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/editor/poster_editor_state_manager.dart';
import '../../routes/poster_router.dart';

class PostersPageRouter extends ConsumerWidget {
  PostersPageRouter({
    Key? key,
    GlobalKey<NavigatorState>? navigatorKey,
  })  : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>(),
        super(key: key);

  static Page page() {
    return MaterialPage(
      child: PostersPageRouter(),
    );
  }

  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, ref) {
    final posterEditorStateManager =
        ref.watch(posterEditorStateManagerProvider);
    final posterViewIndex = ref.watch(posterViewIndexProvider);
    final routerDelegate = BodymoodPosterRouter(
      posterEditorStateManager: posterEditorStateManager,
      posterViewIndex: posterViewIndex,
    );
    return Router(
      routerDelegate: routerDelegate,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
