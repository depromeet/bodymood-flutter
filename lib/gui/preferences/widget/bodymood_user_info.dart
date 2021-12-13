import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/auth/controller/auth_token_manager_provider.dart';
import '../../../bloc/auth/controller/ds/auth_token.dart';
import '../../../bloc/user/model/user.dart';
import '../../../external/user/server_user_api.dart';
import '../../constants/color.dart';
import '../clickable_item/clickable_item.dart';

class BodymoodUserInfo extends ConsumerWidget {
  const BodymoodUserInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessToken = (ref.watch(authTokenManagerProvider).authToken
            as ServerAuthTokenAuthorized)
        .accessToken;

    final user = (ServerUserApi(accessToken)).user();
    return ClickablePreferenceItem(
      leading: const Text(
        '계정정보',
        style: TextStyle(
          fontSize: 16,
          height: 19 / 16,
          color: clPrimaryBlack,
        ),
      ),
      tail: FutureBuilder<BodymoodUser>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              var name = '이름 없음';
              if (!data.isEmpty) {
                name = data.name;
              }
              return Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 19 / 16,
                  color: clPrimaryBlack,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const Text('...');
          }
        },
      ),
    );
  }
}
