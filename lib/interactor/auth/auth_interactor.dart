import '../route/riverpod/route_path_setting.dart';
import '../../routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/auth/controller/ds/auth_token.dart';
import '../route/riverpod/path_provider.dart';
import 'riverpods/auth_token.dart';

class AuthInteractor extends ConsumerWidget {
  const AuthInteractor({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(context, ref) {
    var prevToken = ref.read(authTokenProvider).state;
    ref.listen<StateController<AuthToken>>(
      authTokenProvider,
      (tokenState) {
        final currentToken = tokenState.state;
        currentToken.when(
          authorizedToken: (_, __) => _handleAuthorizedState(prevToken, ref),
          unauthorizedToken: () => _handleUnauthorizedState(prevToken, ref),
        );
        prevToken = currentToken;
      },
    );
    return child;
  }

  _handleAuthorizedState(AuthToken prevToken, WidgetRef ref) {
    // navigate to main only when it was unauthorized
    prevToken.maybeWhen(
      unauthorizedToken: () {
        final pathState = ref.read(currentPathProvider.notifier);
        pathState.updatePath(
          BodymoodRouteSetting(path: BodymoodPath.posters, reset: true),
        );
      },
      orElse: () {},
    );
  }

  _handleUnauthorizedState(AuthToken prevToken, WidgetRef ref) {
    final pathState = ref.read(currentPathProvider.notifier);
    pathState.updatePath(
      BodymoodRouteSetting(path: BodymoodPath.posters, reset: true),
    );
  }
}
