import 'package:flutter/material.dart';

import '../../routes/path.dart';
import '../constants/color.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import 'logout_button/logout_button.dart';
import 'widget/bodymood_agreement.dart';
import 'widget/bodymood_signout.dart';
import 'widget/bodymood_user_info.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.preferences,
      key: ValueKey(BodymoodPath.preferences),
      child: PreferencesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const preferencesAppBar = BodymoodAppbar(
      leading: BodymoodBackButton(),
      title: Text(
        '마이페이지',
        style: TextStyle(
          fontSize: 16,
          height: 19 / 16,
          color: clPrimaryBlack,
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildItems(preferencesAppBar),
            const Positioned(
              left: 24,
              right: 24,
              bottom: 20,
              child: BodymoodLogoutButton(),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildItems(BodymoodAppbar preferencesAppBar) {
    return Column(
      children: [
        preferencesAppBar,
        Expanded(
          child: ListView(
            children: const [
              BodymoodUserInfo(),
              BodymoodAgreement(),
              BodymoodSignout(),
            ],
          ),
        ),
      ],
    );
  }
}
