import 'package:bodymood/bloc/auth/controller/auth_manager.dart';
import 'package:bodymood/bloc/auth/server/aws_server.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authManagerProvider = Provider(
  (_) => AuthManager(
    server: BodyMoodAuthServer(),
  ),
);
