import 'dart:io';

import 'package:bodymood/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('posters_images assets test', () {
    expect(true, File(PostersImages.posterImage).existsSync());
  });
}
