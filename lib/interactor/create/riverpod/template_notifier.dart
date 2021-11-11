import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosterTemplateNotifier extends StateNotifier<IntClass> {
  PosterTemplateNotifier(int state) : super(IntClass(state));

  select(int idx) {
    state = IntClass(idx);
  }

  int get index => state.value;
}

class IntClass {
  final int value;

  IntClass(this.value);
}
