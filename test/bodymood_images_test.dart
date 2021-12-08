import 'dart:io';

import 'package:bodymood/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('bodymood_images assets test', () {
    expect(true, File(BodymoodImages.plusIcon).existsSync());
    expect(true, File(BodymoodImages.bodymoodTitle).existsSync());
    expect(true, File(BodymoodImages.arrowBackIcon).existsSync());
    expect(true, File(BodymoodImages.deleteIcon).existsSync());
  });
}
