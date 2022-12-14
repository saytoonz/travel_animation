import 'package:flutter/material.dart';

class MapAnimationProvider with ChangeNotifier {
  final AnimationController? _animationController;

  MapAnimationProvider(this._animationController) {
    _animationController?.addListener(_onAnimationControllerChanged);
  }

  double get value => _animationController?.value ?? 0;

  void forward() => _animationController?.forward();
  void reverse() => _animationController?.reverse();

  void _onAnimationControllerChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _animationController?.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }
}
