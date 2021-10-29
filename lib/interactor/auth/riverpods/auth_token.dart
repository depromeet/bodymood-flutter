import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/auth/controller/ds/auth_token.dart';

final authTokenProvider = StateProvider<AuthToken>((ref) {
  return const UnauthorizedToken();
});
