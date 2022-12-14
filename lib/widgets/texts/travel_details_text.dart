import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';

import '../../utils/constants.dart';
import '../map_hider.dart';

class TravelDetailsText extends StatelessWidget {
  const TravelDetailsText({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetProvider, AnimationController>(
      builder: (context, provider, animation, child) {
        return Positioned(
          top: topMargin(context) +
              (1 - animation.value) * (mainSquareSize(context) + 32 - 24),
          left: 24 + MediaQuery.of(context).size.width - provider.offset,
          child: Opacity(
            opacity: math.max(0, 4 * provider.page - 3),
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Text(
          'Travel details',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
