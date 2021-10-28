import '../ds/auth_token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTokenProvider = StateProvider<AuthToken>((ref) {
  return const UnauthorizedToken();
});
