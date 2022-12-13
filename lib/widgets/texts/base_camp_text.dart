import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';
import 'package:travel_animation/utils/constants.dart';

class BaseCampText extends StatelessWidget {
  const BaseCampText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetProvider, AnimationController>(
      builder: (context, provider, animation, child) {
        double opacity = math.max(0, (4 * provider.page) - 3);

        return Positioned(
          top: topMargin(context) +
              (mainSquareSize(context) * (1 - animation.value)) +
              16 +
              32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Base camp',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
