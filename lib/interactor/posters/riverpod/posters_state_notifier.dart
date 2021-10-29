import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostersStateNotifier extends StateNotifier<int> {
  PostersStateNotifier(state) : super(state);

  addPoster() {
    state++;
  }

  removePoster() {
    state--;
  }

  int get numPosters => state;
  bool get isEmpty => numPosters == 0;
  bool get isNotEmpty => numPosters != 0;
}
