import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routes/path.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import '../widgets/appbar/text_title.dart';
import 'complete_button/complete_button.dart';
import 'edit_progress/checker_bar.dart';
import 'editable_poster.dart';
import 'riverpod/all_provider.dart';

class PosterEditorPage extends ConsumerWidget {
  const PosterEditorPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.editor,
      key: ValueKey(BodymoodPath.editor),
      child: PosterEditorPage(),
    );
  }

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
