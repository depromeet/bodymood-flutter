import 'package:flutter/material.dart';

abstract class PosterItemsNotifier extends ChangeNotifier {
  PosterItemsNotifier() : super();
  bool get selected;
  void reset([bool shouldNotifyListeners = false]);
}
