import 'controller/auth_manager.dart';
import 'server/aws_server.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authManagerProvider = Provider(
  (_) => AuthManager(
    server: BodyMoodAuthServer(),
  ),
);
