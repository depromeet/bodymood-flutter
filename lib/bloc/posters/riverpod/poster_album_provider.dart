import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/poster_fetch_api.dart';
import '../model/poster_image.dart';
import 'poster_fetcher_provider.dart';

final posterAlbumProvider = ChangeNotifierProvider<PosterAlbumState>(
  (ref) {
    final api = ref.watch(posterFetcherProvider);
    return PosterAlbumState(api: api);
  },
);

class PosterAlbumState extends ChangeNotifier {
  PosterAlbumState({
    required BodymoodPosterFetchApi api,
  }) : _api = api;
  List<PosterImage> _state = [];
  final BodymoodPosterFetchApi _api;

  bool get isEmpty => _state.isEmpty;
  int get length => _state.length;

  PosterImage? operator [](int index) {
    if (length <= index) {
      fetchNextPage();
      return null;
    } else {
      return _state[index];
    }
  }

  refresh() async {
    final data = (await _api.refresh());
    _state = data;
    notifyListeners();
  }

  fetchNextPage() async {
    final data = await _api.getNext();
    if (data.isNotEmpty) {
      _state.addAll(data);
      notifyListeners();
    }
  }
}
