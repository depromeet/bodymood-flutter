import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/gui/preferences/clickable_item/clickable_item.dart';
import 'package:bodymood/gui/widgets/appbar/appbar.dart';
import 'package:bodymood/gui/widgets/appbar/back_button.dart';
import 'package:bodymood/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.preferences,
      key: ValueKey(BodymoodPath.preferences),
      child: PreferencesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const preferencesAppBar = BodymoodAppbar(
      leading: BodymoodBackButton(),
      title: Text(
        '마이페이지',
        style: TextStyle(
          fontSize: 16,
          height: 19 / 16,
          color: clPrimaryBlack,
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            preferencesAppBar,
            ClickablePreferenceItem(
              onClick: () async {
                const _url =
                    'https://suzy8347.notion.site/Bodymood-f3974a2477e74e36a678bf8d19b4dbaa';
                await canLaunch(_url)
                    ? await launch(_url)
                    : throw 'Could not launch $_url';
              },
              leading: const Text(
                '개인정보 처리방침',
                style: TextStyle(
                  fontSize: 16,
                  height: 19 / 16,
                  color: clPrimaryBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
