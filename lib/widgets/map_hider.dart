import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/map_provider.dart';

class MapHider extends StatelessWidget {
  final Widget child;

  const MapHider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MapAnimationProvider>(
      builder: (context, mapProvider, child) {
        return Opacity(
          opacity: math.max(0, 1 - (2 * mapProvider.value)),
          child: child,
        );
      },
      child: child,
    );
  }
}
