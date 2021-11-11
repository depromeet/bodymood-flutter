import '../../../../bloc/posters/core/ds/emotion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emotionsProvider = FutureProvider<List<BodymoodEmotion>>(
  (_) async {
    return Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
      () => [
        for (int i = 0; i < 16; ++i)
          BodymoodEmotion(
            endColor: '0xffffffff',
            startColor: '0xff000000',
            englishTitle: 'Furious',
            koreanTitle: '화난',
          ),
      ],
    );
  },
);
