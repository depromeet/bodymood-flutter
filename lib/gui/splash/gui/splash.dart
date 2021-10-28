import 'dart:async';

import 'package:bodymood/gui/constants/color.dart';
import 'package:bodymood/resources/resources.dart';
import 'package:flutter/material.dart';

class BodyMoodMain extends StatelessWidget {
  static const route = '/';
  const BodyMoodMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: const [
          TitleOverlay(),
        ],
      ),
    );
  }
}

class TitleOverlay extends StatefulWidget {
  const TitleOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<TitleOverlay> createState() => _TitleOverlayState();
}

class _TitleOverlayState extends State<TitleOverlay> {
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
      debugPrint('change text opacity');
      setState(() {
        _visible = true;
        Timer(Duration(milliseconds: _splashDurationInMilliseconds), () {
          debugPrint('go to login page');
          // Navigator.of(context).pushNamed('/login');
        });
      });
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
          child: const Text(
            'Bo\n   dy\nmoo\n     d ',
            style: TextStyle(
              fontSize: 170,
              height: 180 / 170,
              color: clPrimaryBlack,
              letterSpacing: -2,
            ),
          ),
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
}
