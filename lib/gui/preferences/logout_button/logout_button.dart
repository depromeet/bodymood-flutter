import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/app_state/core/app_state_manager.dart';
import '../../constants/color.dart';
import '../../widgets/snackbar/humming_snackbar.dart';

class BodymoodLogoutButton extends ConsumerWidget {
  const BodymoodLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () async {
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
                HummingSnackbar(
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
    required this.buttonBackgroundColor,
    required this.buttonTitle,
    required this.buttonTextColor,
  }) : super(key: key);

  final FutureOr<void> Function()? onClick;
  final Color buttonBackgroundColor;
  final String buttonTitle;
  final Color buttonTextColor;

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
            width: 2,
          ),
        ),
        child: InkWell(
          onTap: () async {
            await onClick?.call();
            Navigator.pop(context);
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
