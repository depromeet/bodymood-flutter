import 'dart:ui';

import 'package:bodymood/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: BodyMood()));
}

class BodyMood extends StatelessWidget {
  const BodyMood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextTheme = Theme.of(context).textTheme;
    final playfairTextTheme = GoogleFonts.playfairDisplayTextTheme(
      defaultTextTheme,
    );
    return MaterialApp(
      theme: ThemeData(
        textTheme: playfairTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff18192b),
              onPrimary: Colors.white,
            ),
      ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
