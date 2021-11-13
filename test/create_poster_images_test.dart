import 'dart:io';

import 'package:bodymood/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('create_poster_images assets test', () {
    expect(true, File(CreatePosterImages.commingSoon).existsSync());
    expect(true, File(CreatePosterImages.firstTemplate).existsSync());
  });
}
