import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/app_state/core/app_state_manager.dart';
import '../../constants/color.dart';
import '../../widgets/snackbar/bodymood_snackbar.dart';

class BodymoodLogoutButton extends ConsumerWidget {
  const BodymoodLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return _BottomSheetButton(
      onClick: () async {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const _BottomSheetBody();
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
        );
      },
      buttonBackgroundColor: clPrimaryBlack,
      buttonTextColor: clPrimaryWhite,
      buttonTitle: '로그아웃',
      popAfterCall: false,
    );
  }
}

class _BottomSheetBody extends ConsumerWidget {
  const _BottomSheetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          const SizedBox(height: 20),
          _buildButtonBar(context, ref),
        ],
      ),
    );
  }

  Row _buildButtonBar(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Expanded(
          child: _BottomSheetButton(
            buttonBackgroundColor: clPrimaryWhite,
            buttonTitle: '취소',
            buttonTextColor: clPrimaryBlack,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _BottomSheetButton(
            onClick: () async {
              // Navigator.pop(context);
              await ref.read(appStateManagerProvider.notifier).resetApp();
              ScaffoldMessenger.of(context).showSnackBar(
                BodymoodSnackbar(
                  message: '로그아웃 되었습니다.',
                ),
              );
            },
            buttonBackgroundColor: clPrimaryBlack,
            buttonTitle: '로그아웃',
            buttonTextColor: clPrimaryWhite,
          ),
        ),
      ],
    );
  }

  Text _buildTitle() {
    return const Text(
      '로그아웃 하시겠어요?',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 19 / 16,
        color: clPrimaryBlack,
      ),
    );
  }
}

class _BottomSheetButton extends StatelessWidget {
  const _BottomSheetButton({
    Key? key,
    this.onClick,
    this.popAfterCall = true,
    required this.buttonBackgroundColor,
    required this.buttonTitle,
    required this.buttonTextColor,
  }) : super(key: key);

  final FutureOr<void> Function()? onClick;
  final Color buttonBackgroundColor;
  final String buttonTitle;
  final Color buttonTextColor;
  final bool popAfterCall;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Ink(
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: clPrimaryBlack,
            width: buttonBackgroundColor == clPrimaryBlack ? 0 : 2,
          ),
        ),
        child: InkWell(
          onTap: () async {
            await onClick?.call();
            if (popAfterCall) {
              Navigator.pop(context);
            }
          },
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 19 / 16,
                color: buttonTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
