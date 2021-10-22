import 'dart:io';

import 'package:bodymood/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('my_album_images assets test', () {
    expect(true, File(MyAlbumImages.posterImage).existsSync());
  });
}
