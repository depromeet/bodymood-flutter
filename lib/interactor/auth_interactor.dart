import '../../bloc/auth/controller/ds/auth_token.dart';
import '../../bloc/auth/controller/riverpods/auth_token.dart';
import '../../routes/path.dart';
import '../../routes/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInteractor extends ConsumerWidget {
  const AuthInteractor({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(context, ref) {
    ref.listen<StateController<AuthToken>>(
      authTokenProvider,
      (tokenState) {
        tokenState.state.when(
          authorizedToken: (_, __) {
            final path = ref.read(currentPathProvider);
            Navigator.of(context).pushNamed(path);
          },
          unauthorizedToken: () {
            Navigator.of(context).pushNamed(BodyMoodPath.login);
          },
        );
      },
    );
    return child;
  }
}
