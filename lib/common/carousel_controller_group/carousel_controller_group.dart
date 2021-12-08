import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_state.dart';
import 'package:carousel_slider/utils.dart';
import 'package:flutter/material.dart';

typedef OnPageChangedHandler = void Function(
  int index,
  CarouselPageChangedReason reason,
);

class CarouselControllerGroup implements CarouselControllerImpl {
  Completer _readyCompleter = Completer();
  final List<OnPageChangedHandler> _pageChangedHandlers = [];

  final _states = <CarouselState?>[];

  void dispose() {
    _states.clear();
    _readyCompleter = Completer();
    _pageChangedHandlers.clear();
  }

  @override
  set state(CarouselState? state) {
    _states.add(state);
    if (!_readyCompleter.isCompleted) {
      _readyCompleter.complete();
    }
  }

  void _setModeController() {
    for (final _state in _states) {
      _state?.changeMode(CarouselPageChangedReason.controller);
    }
  }

  @override
  bool get ready => _states.isNotEmpty && _states.any((state) => state != null);

  @override
  // ignore: prefer_void_to_null
  Future<Null> get onReady => _readyCompleter.future as Future<Null>;

  /// Animates the controlled [CarouselSlider] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  @override
  Future<void> nextPage(
      {Duration? duration = const Duration(milliseconds: 300),
      Curve? curve = Curves.linear}) async {
    final _carousels = <Future>[];
    for (final _state in _states) {
      final bool isNeedResetTimer =
          _state!.options.pauseAutoPlayOnManualNavigate;
      if (isNeedResetTimer) {
        _state.onResetTimer();
      }
      _setModeController();
      final future =
          _state.pageController!.nextPage(duration: duration!, curve: curve!);
      _carousels.add(future);
      if (isNeedResetTimer) {
        _state.onResumeTimer();
      }
    }
    await Future.wait(_carousels);
  }

  /// Animates the controlled [CarouselSlider] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  @override
  Future<void> previousPage(
      {Duration? duration = const Duration(milliseconds: 300),
      Curve? curve = Curves.linear}) async {
    final _carousels = <Future>[];
    for (final _state in _states) {
      final bool isNeedResetTimer =
          _state!.options.pauseAutoPlayOnManualNavigate;
      if (isNeedResetTimer) {
        _state.onResetTimer();
      }
      _setModeController();
      final future = _state.pageController!
          .previousPage(duration: duration!, curve: curve!);
      _carousels.add(future);
      if (isNeedResetTimer) {
        _state.onResumeTimer();
      }
    }
    await Future.wait(_carousels);
  }

  /// Changes which page is displayed in the controlled [CarouselSlider].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  @override
  void jumpToPage(int page) {
    for (final _state in _states) {
      final index = getRealIndex(_state!.pageController!.page!.toInt(),
          _state.realPage - _state.initialPage, _state.itemCount);

      _setModeController();
      final int pageToJump =
          _state.pageController!.page!.toInt() + page - index;
      _state.pageController!.jumpToPage(pageToJump);
    }
  }

  /// Animates the controlled [CarouselSlider] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  @override
  Future<void> animateToPage(int page,
      {Duration? duration = const Duration(milliseconds: 300),
      Curve? curve = Curves.linear}) async {
    final _carousels = <Future>[];
    for (final _state in _states) {
      final bool isNeedResetTimer =
          _state!.options.pauseAutoPlayOnManualNavigate;
      if (isNeedResetTimer) {
        _state.onResetTimer();
      }
      final index = getRealIndex(_state.pageController!.page!.toInt(),
          _state.realPage - _state.initialPage, _state.itemCount);
      _setModeController();
      final future = _state.pageController!.animateToPage(
          _state.pageController!.page!.toInt() + page - index,
          duration: duration!,
          curve: curve!);
      _carousels.add(future);
      if (isNeedResetTimer) {
        _state.onResumeTimer();
      }
    }
    await Future.wait(_carousels);
  }

  /// Starts the controlled [CarouselSlider] autoplay.
  ///
  /// The carousel will only autoPlay if the [autoPlay] parameter
  /// in [CarouselOptions] is true.
  @override
  void startAutoPlay() {
    for (final _state in _states) {
      _state!.onResumeTimer();
    }
  }

  /// Stops the controlled [CarouselSlider] from autoplaying.
  ///
  /// This is a more on-demand way of doing this. Use the [autoPlay]
  /// parameter in [CarouselOptions] to specify the autoPlay behaviour of the carousel.
  @override
  void stopAutoPlay() {
    for (final _state in _states) {
      _state!.onResetTimer();
    }
  }

  Future<void> syncAll(
    int index, [
    CarouselPageChangedReason reason = CarouselPageChangedReason.manual,
  ]) async {
    if (reason == CarouselPageChangedReason.manual) {
      animateToPage(index);
      for (final handler in _pageChangedHandlers) {
        handler(index, reason);
      }
    }
  }

  void addPageChangedListener(OnPageChangedHandler handler) =>
      _pageChangedHandlers.add(handler);
  void removePageChangedListener(OnPageChangedHandler handler) =>
      _pageChangedHandlers.remove(handler);
}
