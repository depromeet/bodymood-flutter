import 'package:bodymood/bloc/auth/controller/ds/social_type.dart';
import 'package:bodymood/gui/login/login_button.dart';
import 'package:bodymood/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';

class LoginPage extends StatelessWidget {
  static const route = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackground(),
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
            buttonColor: Color(0xfffee500),
            textColor: Colors.black,
            type: KakaoAuthType(),
          ),
          SizedBox(height: 18),
          LoginButton(
            buttonColor: Colors.black,
            textColor: Colors.white,
            type: AppleAuthType(),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      SplashImages.background,
      fit: BoxFit.cover,
    );
  }
}
