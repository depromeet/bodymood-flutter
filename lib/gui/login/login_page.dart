import 'package:bodymood/bloc/auth/controller/ds/social_type.dart';
import 'package:bodymood/gui/login/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const route = '/login';
  const LoginPage({Key? key}) : super(key: key);

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
