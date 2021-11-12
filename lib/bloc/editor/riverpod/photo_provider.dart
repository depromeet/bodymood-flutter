import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bloc/posters/core/ds/poster_store.dart';
import 'seletable_item_notifier.dart';

final selectedPhotoProvider = ChangeNotifierProvider<PhotoNotifier>(
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

  @override
  void reset([bool shouldNotifyListeners = false]) {
    _image = EmptyImageStore();
    if (shouldNotifyListeners) {
      notifyListeners();
    }
  }
}
