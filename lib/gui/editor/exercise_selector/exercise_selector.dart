import 'return_button.dart';
import 'tabs/selector_body.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/appbar/back_button.dart';
import '../../widgets/appbar/text_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExerciseSelectorPage extends StatelessWidget {
  const ExerciseSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
      ),
    );
  }
}
