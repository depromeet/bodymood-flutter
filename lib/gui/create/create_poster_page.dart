import '../../routes/path.dart';

import 'template/comming_soon.dart';
import 'template/first_template.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import '../widgets/appbar/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Widget> _templates = [
  const FirstPosterTemplate(),
];

class CreatePosterPage extends ConsumerWidget {
  const CreatePosterPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.create,
      key: ValueKey(BodymoodPath.create),
      child: CreatePosterPage(),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppbar(ref),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
                itemBuilder: (context, index) {
                  if (index == _templates.length) {
                    return const CommingSoonTemplate();
                  } else {
                    return _templates[index];
                  }
                },
                itemCount: _templates.length + 1,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 16);
                },
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  BodymoodAppbar _buildAppbar(WidgetRef ref) {
    const title = '템플릿 선택';
    return const BodymoodAppbar(
      leading: BodymoodBackButton(),
      title: AppbarTextTitle(title: title),
    );
  }
}
