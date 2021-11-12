import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/app_state/core/app_state_manager.dart';
import '../../routes/path.dart';
import '../constants/color.dart';

class BodyMoodSplashPage extends StatelessWidget {
  const BodyMoodSplashPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage(
      name: BodymoodPath.splash,
      key: ValueKey(BodymoodPath.splash),
      child: BodyMoodSplashPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: const [
          _TitleOverlay(),
        ],
      ),
    );
  }
}

class _TitleOverlay extends ConsumerStatefulWidget {
  const _TitleOverlay({
    Key? key,
  }) : super(key: key);

  @override
  _TitleOverlayState createState() => _TitleOverlayState();
}

class _TitleOverlayState extends ConsumerState<_TitleOverlay> {
  bool _visible = false;
  final _splashDurationInMilliseconds = 1000;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      finishSplash();
    });
  }

  void finishSplash() {
    if (mounted && !_visible) {
      setState(() {
        _visible = true;
      });
      Timer(
        Duration(milliseconds: _splashDurationInMilliseconds + 500),
        () {
          final appStateManager = ref.read(appStateManageProvider);
          appStateManager.initialize();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const titleRatio = 343 / 720;
    final appTitle = AspectRatio(
      aspectRatio: titleRatio,
      child: FittedBox(
        alignment: Alignment.centerRight,
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: _splashDurationInMilliseconds),
          child: _buildMainText(),
        ),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(
          flex: 44,
        ),
        Expanded(
          flex: 720,
          child: appTitle,
        ),
        const Spacer(
          flex: 48,
        ),
      ],
    );
  }

  Text _buildMainText() {
    return Text(
      'Bo\n   dy\nmoo\n     d ',
      style: GoogleFonts.playfairDisplay().copyWith(
        fontSize: 170,
        height: 180 / 170,
        color: clPrimaryBlack,
        letterSpacing: -2,
      ),
    );
  }
}
