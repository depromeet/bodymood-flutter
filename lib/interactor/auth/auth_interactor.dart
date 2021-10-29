import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/auth/controller/ds/auth_token.dart';
import '../../../routes/path.dart';
import '../../../routes/path_provider.dart';
import 'riverpods/auth_token.dart';

class AuthInteractor extends ConsumerWidget {
  const AuthInteractor({Key? key, required this.child, required this.navKey})
      : super(key: key);

  final Widget child;
  final GlobalKey<NavigatorState> navKey;

  @override
  Widget build(context, ref) {
    ref.listen<StateController<AuthToken>>(
      authTokenProvider,
      (tokenState) {
        final nav = navKey.currentState!;
        tokenState.state.when(
          authorizedToken: (_, __) {
            final path = ref.read(currentPathProvider).state;
            nav.pushReplacementNamed(path);
          },
          unauthorizedToken: () {
            nav.pushReplacementNamed(BodyMoodPath.login);
          },
        );
      },
    );
    return child;
  }
}
