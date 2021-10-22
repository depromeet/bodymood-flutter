import 'dart:io';

import 'package:bodymood/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('splash_images assets test', () {
    expect(true, File(SplashImages.bodymoodText).existsSync());
    expect(true, File(SplashImages.background).existsSync());
  });
}
