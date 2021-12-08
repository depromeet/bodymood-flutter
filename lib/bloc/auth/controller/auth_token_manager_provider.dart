import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../server/aws_server.dart';
import 'auth_token_manager.dart';

final authTokenManagerProvider = Provider(
  (ref) {
    return BodymoodAuthTokenManager(
      server: BodymoodAuthServer(),
    );
  },
);
