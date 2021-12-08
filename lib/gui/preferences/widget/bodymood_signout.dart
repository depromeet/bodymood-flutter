import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/app_state/core/app_state_manager.dart';
import '../../../bloc/auth/controller/auth_token_manager_provider.dart';
import '../../../bloc/auth/server/aws_server.dart';
import '../../constants/color.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';
import '../../widgets/appbar/text_title.dart';
import '../../widgets/snackbar/humming_snackbar.dart';
import '../clickable_item/clickable_item.dart';

class BodymoodSignout extends StatelessWidget {
  const BodymoodSignout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        showDialog(
          context: context,
          builder: (context) {
            return const SignoutPage();
          },
        );
      },
    );
  }
}

final _signoutDisabledState = StateProvider.autoDispose((_) => false);

class SignoutPage extends ConsumerWidget {
  const SignoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final signoutDisabled = ref.watch(_signoutDisabledState);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BodymoodAppbar(
              leading: BodymoodBackButton(),
              title: AppbarTextTitle(title: '계정 삭제'),
            ),
            const SizedBox(height: 17),
            _buildBody(),
            const Spacer(),
            _buildButton(context, ref, signoutDisabled),
          ],
        ),
      ),
    );
  }

  Padding _buildButton(
      BuildContext context, WidgetRef ref, StateController<bool> disabled) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          side: BorderSide(
            color: disabled.state ? clGray400 : clPrimaryBlack,
            width: 2,
          ),
        ),
        onPressed: disabled.state ? null : () => _handleSignOut(context, ref),
        child: Center(
          child: Text(
            '계정 삭제',
            style: TextStyle(
              fontSize: 16,
              height: 24 / 16,
              letterSpacing: -0.1,
              color: disabled.state ? clGray400 : clPrimaryBlack,
            ),
          ),
        ),
      ),
    );
  }

  _handleSignOut(BuildContext context, WidgetRef ref) async {
    ref.read(_signoutDisabledState).state = true;
    final authServer = BodymoodAuthServer();
    final authToken = ref.read(authTokenManagerProvider).authToken;
    await authServer.signout(authToken);
    final controller = ScaffoldMessenger.of(context).showSnackBar(
      HummingSnackbar(
        message: '계정이 삭제되었습니다.',
      ),
    );
    await controller.closed;
    Navigator.of(context).pop();
    ref.read(appStateManagerProvider.notifier).resetApp();
  }

  Padding _buildBody() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Text(
        '계정을 삭제하시겠습니까?\n'
        '삭제 후 데이터는 복구되지 않습니다.',
        style: TextStyle(
          fontSize: 16,
          height: 19 / 16,
          color: clPrimaryBlack,
        ),
      ),
    );
  }
}
