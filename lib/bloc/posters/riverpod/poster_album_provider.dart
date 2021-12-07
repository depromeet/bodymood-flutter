import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/poster_fetch_api.dart';
import '../model/poster_image.dart';
import 'poster_fetcher_provider.dart';

final posterAlbumProvider =
    StateNotifierProvider<PosterAlbumState, List<PosterImage>>(
  (ref) {
    final api = ref.watch(posterFetcherProvider);
    return PosterAlbumState([], api: api);
  },
);

class PosterAlbumState extends StateNotifier<List<PosterImage>> {
  PosterAlbumState(
    List<PosterImage> state, {
    required BodymoodPosterFetchApi api,
  })  : _api = api,
        super(state);

  final BodymoodPosterFetchApi _api;

  PosterImage? operator [](int index) {
    if (length <= index) {
      fetchNextPage();
      return null;
    } else {
      return state[index];
    }
  }

  int get length => state.length;

  refresh() async {
    final data = (await _api.refresh());
    state = [
      ...data,
    ];
  }

  fetchNextPage() async {
    final data = await _api.getNext();
    if (data.isNotEmpty) {
      state = [
        ...state,
        ...data,
      ];
    }
  }
}
