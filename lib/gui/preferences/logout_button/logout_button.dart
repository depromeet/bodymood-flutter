import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/app_state/core/app_state_manager.dart';
import '../../../encloser/app_view/app_view_interactor_encloser.dart';
import '../../constants/color.dart';

class BodymoodLogoutButton extends ConsumerWidget {
  const BodymoodLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () async {
        final appStateManager = ref.read(appStateManagerProvider.notifier);
        await appStateManager.resetApp();
        ref.read(appViewPageEncloser).showSplashView();
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: clPrimaryBlack,
          borderRadius: BorderRadius.circular(2),
        ),
        child: const Center(
          child: Text(
            '로그아웃',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              height: 1.5,
              color: clPrimaryWhite,
            ),
          ),
        ),
      ),
    );
  }
}
