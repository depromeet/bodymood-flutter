import '../emotion_selector/emotional_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../routes/path.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';
import '../../widgets/appbar/text_title.dart';
import 'return_button.dart';
import 'tabs/selector_body.dart';

class ExerciseSelectionPage extends StatelessWidget {
  const ExerciseSelectionPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.selectExercises,
      key: ValueKey(BodymoodPath.selectExercises),
      child: ExerciseSelectionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const EmotionalBackground(onlySelected: true),
            Column(
              children: const [
                BodymoodAppbar(
                  leading: BodymoodBackButton(),
                  title: AppbarTextTitle(title: '운동 선택'),
                ),
                SizedBox(height: 18),
                Expanded(
                  child: ExerciseSelectorBody(),
                ),
                ReturnExerciseButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
