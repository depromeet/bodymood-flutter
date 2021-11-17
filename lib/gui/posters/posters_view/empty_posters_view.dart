import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyPostersView extends StatelessWidget {
  const EmptyPostersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(
              flex: 284,
            ),
            Expanded(
              flex: 55,
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildEnglishTitle(),
                    const SizedBox(height: 16),
                    _buildKoreanTitle(),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 379,
            ),
          ],
        ),
        const SingleChildScrollView(physics: AlwaysScrollableScrollPhysics()),
      ],
    );
  }

  Widget _buildKoreanTitle() {
    return const Text(
      '나만의 바디무드 포스터를 만들어보세요.',
      style: TextStyle(
        fontSize: 12,
        height: 14 / 12,
        fontWeight: FontWeight.bold,
        color: Color(0xff878787),
      ),
    );
  }

  Widget _buildEnglishTitle() {
    return Text(
      'Create your own Bodymood poster.',
      style: GoogleFonts.playfairDisplay().copyWith(
        fontSize: 18,
        height: 1.4,
        fontWeight: FontWeight.bold,
        color: const Color(0xff878787),
      ),
    );
  }
}
