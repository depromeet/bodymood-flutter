import 'package:flutter/material.dart';

import '../../bloc/auth/controller/ds/social_type.dart';
import '../../routes/path.dart';
import 'login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.login,
      key: ValueKey(BodymoodPath.login),
      child: LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildLoginButtonColumn(),
        ],
      ),
    );
  }

  Center _buildLoginButtonColumn() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          LoginButton(
            type: KakaoAuthType(),
          ),
        ],
      ),
    );
  }
}
