import 'package:flutter/material.dart';

import '../../routes/path.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/appbar/back_button.dart';
import '../widgets/appbar/text_title.dart';
import 'carousel/holder_carousel.dart';
import 'carousel/template_carousel.dart';

class CreatePosterPage extends StatelessWidget {
  const CreatePosterPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.create,
      key: ValueKey(BodymoodPath.create),
      child: CreatePosterPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAppbar(),
            const Spacer(flex: 65),
            const Expanded(
              flex: 437,
              child: TemplateCarousel(),
            ),
            const Spacer(flex: 41),
            const Expanded(
              flex: 49,
              child: TemplateHolderCarousel(),
            ),
            const Spacer(flex: 126),
          ],
        ),
      ),
    );
  }

  BodymoodAppbar _buildAppbar() {
    const title = '템플릿 선택';
    return const BodymoodAppbar(
      leading: BodymoodBackButton(),
      title: AppbarTextTitle(title: title),
    );
  }
}
