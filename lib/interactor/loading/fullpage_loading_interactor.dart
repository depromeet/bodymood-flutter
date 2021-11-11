import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpods/loading_state_provider.dart';

class FullpageLoadingInteractor extends ConsumerWidget {
  const FullpageLoadingInteractor({Key? key, required this.child})
      : super(key: key);

  final Widget child;
  static setLoading(WidgetRef ref) {
    ref.read(isLoadingStateProvider).state = true;
  }

  static unsetLoading(WidgetRef ref) {
    ref.read(isLoadingStateProvider).state = false;
  }

  @override
  Widget build(context, ref) {
    final isLoading = ref.watch(isLoadingStateProvider).state;
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        isLoading
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
