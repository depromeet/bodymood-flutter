import 'package:bodymood/bloc/auth/controller/ds/social_type.dart';
import 'package:bodymood/bloc/auth/controller/inteface/social_auth_provider.dart';
import 'package:bodymood/bloc/auth/providers/apple/apple_auth_provider.dart';
import 'package:bodymood/bloc/auth/providers/kakao/kakao_auth_provider.dart';
import 'package:bodymood/bloc/auth/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    Key? key,
    required this.buttonColor,
    required this.type,
    required this.textColor,
  }) : super(key: key);

  final Color buttonColor;
  final Color textColor;
  final SocialType type;

  @override
  Widget build(context, ref) {
    final authManager = ref.read(authManagerProvider);
    final title = type.map<String>(
      apple: (_) => '애플로 로그인 하기',
      kakao: (_) => '카카오로 로그인 하기',
    );
    final socialAuthProvider = type.map<SocialAuthProviderBase>(
      kakao: (_) => KakaoAuthProvider(),
      apple: (_) => AppleAuthProvider(),
    );

    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
      ),
      constraints: const BoxConstraints.expand(
        width: 300,
        height: 45,
      ),
      child: TextButton(
        onPressed: () async {
          final token = await authManager.updateAuthToken(socialAuthProvider);
          debugPrint(token.toString());
        },
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
