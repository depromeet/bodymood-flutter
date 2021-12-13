import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/posters/riverpod/poster_album_provider.dart';
import '../../constants/color.dart';

class CreateTooltip extends ConsumerWidget {
  const CreateTooltip({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmpty = ref.watch(posterAlbumProvider).isEmpty;
    return isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Click the button',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  height: 1.4,
                  fontWeight: FontWeight.bold,
                  color: clPrimaryBlack,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '버튼을 눌러 포스터를 만들어주세요.',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  fontWeight: FontWeight.bold,
                  color: clPrimaryBlack,
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
