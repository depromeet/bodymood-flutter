import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

import '../../../routes/path.dart';
import '../../constants/color.dart';
import '../emotion_selector/emotional_background.dart';
import 'poster_preview.dart';
import 'preview_bottom_sheet.dart';

class SharePosterPage extends ConsumerWidget {
  const SharePosterPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.editorPreview,
      key: ValueKey(BodymoodPath.editorPreview),
      child: SharePosterPage(),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Stack(
        children: [
          const EmotionalBackground(opacity: 0.2),
          _buildMain(),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PreviewBottomSheet(),
          ),
        ],
      ),
    );
  }

  Column _buildMain() {
    final date = intl.DateFormat('yyyy년 M월 d일').format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PosterCreationDate(date: date),
        const SizedBox(height: 48),
        const PosterPreview(),
      ],
    );
  }
}

class PosterCreationDate extends StatelessWidget {
  const PosterCreationDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 16,
              height: 19 / 16,
              color: clPrimaryBlack,
            ),
          ),
        ),
      ),
    );
  }
}
