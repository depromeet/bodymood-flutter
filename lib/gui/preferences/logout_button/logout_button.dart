import 'package:bodymood/bloc/app_state/core/app_state_manager.dart';
import 'package:bodymood/gui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodymoodLogoutButton extends ConsumerWidget {
  const BodymoodLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () async {
        final appStateManager = ref.read(appStateManagerProvider);
        await appStateManager.resetApp();
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
