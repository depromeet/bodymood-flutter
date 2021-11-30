import 'package:flutter/material.dart';

import '../../routes/path.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import '../widgets/appbar/text_title.dart';
import 'complete_button/complete_button.dart';
import 'edit_progress/checker_bar.dart';
import 'editable_poster.dart';

class PosterEditorPage extends StatelessWidget {
  const PosterEditorPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.editor,
      key: ValueKey(BodymoodPath.editor),
      child: PosterEditorPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            BodymoodAppbar(
              leading: BodymoodBackButton(),
              title: AppbarTextTitle(title: '포스터 편집'),
              tail: CompletePosterEditingButton(),
            ),
            SizedBox(height: 8),
            EditProgressCheckerBar(),
            SizedBox(height: 24),
            Expanded(
              child: EditablePosterArea(),
            ),
          ],
        ),
      ),
    );
  }
}
