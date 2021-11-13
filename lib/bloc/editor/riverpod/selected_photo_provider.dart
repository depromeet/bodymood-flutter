import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/posters/core/ds/poster_store.dart';
import '../base/seletable_item_notifier.dart';

final selectedImageProvider = ChangeNotifierProvider<PhotoNotifier>(
  (_) => PhotoNotifier(),
);

class PhotoNotifier extends PosterItemsNotifier {
  PhotoNotifier();
  ImageStore _image = ImageStore.empty();

  ImageStore get image => _image;

  updatePhoto(ImageStore store) {
    _image = store;
    notifyListeners();
  }

  @override
  bool get selected => _image.maybeMap(empty: (_) => false, orElse: () => true);

  ImageProvider? get imageProvider => image.map(
        local: (data) => FileImage(File(data.path)),
        remote: (data) => NetworkImage(data.path),
        empty: (_) => null,
      );

  @override
  void reset([bool shouldNotifyListeners = false]) {
    _image = EmptyImageStore();
    if (shouldNotifyListeners) {
      notifyListeners();
    }
  }
}
