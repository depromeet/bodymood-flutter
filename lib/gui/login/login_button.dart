import 'package:bodymood/bloc/auth/controller/ds/social_type.dart';
import 'package:bodymood/bloc/auth/controller/inteface/social_auth_provider.dart';
import 'package:bodymood/bloc/auth/providers/apple/apple_auth_provider.dart';
import 'package:bodymood/bloc/auth/providers/kakao/kakao_auth_provider.dart';
import 'package:bodymood/bloc/auth/auth_manager.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    Key? key,
    required this.type,
  }) : super(key: key);

  final SocialType type;

  @override
  Widget build(context, ref) {
    final authManager = ref.read(authManagerProvider);
    final title = type.map<String>(
      apple: (_) => 'Apple 로그인',
      kakao: (_) => '카카오 로그인',
    );
    final socialAuthProvider = type.map<SocialAuthProviderBase>(
      kakao: (_) => KakaoAuthProvider(),
      apple: (_) => AppleAuthProvider(),
    );
    final textColor = type.map<Color>(
      apple: (_) => clPrimaryWhite,
      kakao: (_) => clPrimaryBlack,
    );
    final buttonColor = type.map(
      apple: (_) => clPrimaryBlack,
      kakao: (_) => const Color(0xfffee500),
    );
    final iconPath = type.map(
      apple: (_) => LoginImages.appleLoginIcon,
      kakao: (_) => LoginImages.kakaoLoginIcon,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                height: 19 / 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
