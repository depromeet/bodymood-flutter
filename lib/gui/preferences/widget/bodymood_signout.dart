import 'package:bodymood/bloc/auth/controller/auth_token_manager_provider.dart';
import 'package:bodymood/bloc/auth/server/aws_server.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/preferences/clickable_item/clickable_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodymoodSignout extends ConsumerWidget {
  const BodymoodSignout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ClickablePreferenceItem(
      leading: const Text(
        '계정삭제',
        style: TextStyle(
          fontSize: 16,
          height: 19 / 16,
          color: clPrimaryBlack,
        ),
      ),
      onClick: () async {
        final authServer = BodymoodAuthServer();
        final authToken = ref.read(authTokenManagerProvider).authToken;
        await authServer.signout(authToken);
      },
    );
  }
}
