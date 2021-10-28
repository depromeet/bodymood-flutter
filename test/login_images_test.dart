import 'dart:io';

import 'package:bodymood/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('login_images assets test', () {
    expect(true, File(LoginImages.kakaoLoginIcon).existsSync());
    expect(true, File(LoginImages.appleLoginIcon).existsSync());
  });
}
