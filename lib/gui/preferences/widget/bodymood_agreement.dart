import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/color.dart';
import '../clickable_item/clickable_item.dart';

class BodymoodAgreement extends StatelessWidget {
  const BodymoodAgreement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickablePreferenceItem(
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
    );
  }
}
