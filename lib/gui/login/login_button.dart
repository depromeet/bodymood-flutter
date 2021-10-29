import 'package:bodymood/interactor/loading/fullpage_loading_interactor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/auth/auth_manager.dart';
import '../../bloc/auth/controller/ds/social_type.dart';
import '../../bloc/auth/controller/inteface/social_auth_provider.dart';
import '../../bloc/auth/providers/apple/apple_auth_provider.dart';
import '../../bloc/auth/providers/kakao/kakao_auth_provider.dart';
import '../../interactor/auth/riverpods/auth_token.dart';
import '../../interactor/loading/riverpods/loading_state_provider.dart';
import '../../resources/resources.dart';
import '../../routes/path.dart';
import '../../routes/path_provider.dart';
import '../constants/color.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    Key? key,
    required this.type,
  }) : super(key: key);

  final SocialType type;

  @override
  Widget build(context, ref) {
    final title = type.map<String>(
      apple: (_) => 'Apple 로그인',
      kakao: (_) => '카카오 로그인',
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
        onPressed: () => onLoginButtonClicked(ref),
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

  onLoginButtonClicked(WidgetRef ref) async {
    final authManager = ref.read(authManagerProvider);
    final tokenProvider = ref.read(authTokenProvider);
    final pathProvider = ref.read(currentPathProvider);
    final socialAuthProvider = type.map<SocialAuthProviderBase>(
      kakao: (_) => KakaoAuthProvider(),
      apple: (_) => AppleAuthProvider(),
    );

    FullpageLoadingInteractor.setLoading(ref);
    final token = await authManager.updateAuthToken(socialAuthProvider);
    token.when(
      authorizedToken: (_, __) {
        pathProvider.state = BodyMoodPath.posters;
        tokenProvider.state = token;
      },
      unauthorizedToken: () {
        // debugPrint('failed to authorize');
      },
    );
    FullpageLoadingInteractor.unsetLoading(ref);
  }
}
