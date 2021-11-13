import 'dart:io';

import 'package:bodymood/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('edit_poster_images assets test', () {
    expect(true, File(EditPosterImages.iconShare).existsSync());
    expect(true, File(EditPosterImages.checkIconEnabled).existsSync());
    expect(true, File(EditPosterImages.fromAlbumIcon).existsSync());
    expect(true, File(EditPosterImages.fromCameraIcon).existsSync());
    expect(true, File(EditPosterImages.checkIconDisabled).existsSync());
    expect(true, File(EditPosterImages.iconViewAlbum).existsSync());
  });
}
