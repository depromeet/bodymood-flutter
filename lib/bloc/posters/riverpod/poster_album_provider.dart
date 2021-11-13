import 'package:bodymood/bloc/posters/api/poster_fetch_api.dart';
import 'package:bodymood/bloc/posters/model/poster_image.dart';
import 'package:bodymood/bloc/posters/riverpod/poster_fetcher_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    if (state.length <= index) {
      fetchNextPage();
      return null;
    } else {
      return state[index];
    }
  }

  int get length => state.length;

  refresh() async {
    debugPrint('refresh posters');
    final data = (await _api.refresh());
    state = [
      ...data,
    ];
  }

  fetchNextPage() async {
    debugPrint('refresh posters');
    final data = await _api.getNext();
    if (data.isNotEmpty) {
      state = [
        ...state,
        ...data,
      ];
    }
  }
}
