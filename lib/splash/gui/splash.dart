import 'dart:async';

import 'package:bodymood/resources/resources.dart';
import 'package:flutter/material.dart';

class BodyMoodMain extends StatefulWidget {
  static const route = '/';
  const BodyMoodMain({Key? key}) : super(key: key);

  @override
  State<BodyMoodMain> createState() => _BodyMoodMainState();
}

class _BodyMoodMainState extends State<BodyMoodMain> {
  @override
  void initState() {
    super.initState();
    finishSplash();
  }

  void finishSplash() {
    Timer(const Duration(milliseconds: 1000), () {
      if (mounted) {
        debugPrint('go to login page');
        Navigator.of(context).pushNamed('/login');
      } else {
        debugPrint('not yet mounted');
        finishSplash();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var backgroundImage = Image.asset(
      SplashImages.background,
      fit: BoxFit.cover,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage,
          const TitleOverlay(),
        ],
      ),
    );
  }
}

class TitleOverlay extends StatelessWidget {
  const TitleOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleRatio = 395 / 720;
    const titleTransformDx = 35.0;
    final appTitle = Opacity(
      opacity: 0.6,
      child: AspectRatio(
        aspectRatio: titleRatio,
        child: FittedBox(
          alignment: Alignment.centerRight,
          child: Transform.translate(
            offset: const Offset(titleTransformDx, 0),
            child: const Text(
              'Bo\n  dy\nmoo\n     d',
              style: TextStyle(
                fontSize: 200,
                height: 180 / 200,
                color: Color(0xffF3F6FA),
                letterSpacing: -1,
              ),
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
