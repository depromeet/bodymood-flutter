import 'edit_progress/checker_bar.dart';
import 'editable_poster.dart';
import 'riverpod/all_provider.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import '../widgets/appbar/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'complete_button/complete_button.dart';

class EditPosterPage extends ConsumerWidget {
  const EditPosterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posterItems = ref.watch(posterItemsProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BodymoodAppbar(
              leading: BodymoodBackButton(
                onTap: () {
                  posterItems.reset();
                },
              ),
              title: const AppbarTextTitle(title: '포스터 편집'),
              tail: const CompletePosterEditingButton(),
            ),
            const SizedBox(height: 8),
            const EditProgressCheckerBar(),
            const SizedBox(height: 24),
            const Expanded(
              child: EditablePosterArea(),
            ),
          ],
        ),
      ),
    );
  }
}
