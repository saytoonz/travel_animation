import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';
import 'package:travel_animation/utils/app_colors.dart';

import '../../utils/constants.dart';
import '../map_hider.dart';

class BaseCampTimeText extends StatelessWidget {
  const BaseCampTimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetProvider, AnimationController>(
      builder: (context, provider, animation, child) {
        double opacity = math.max(0, 4 * provider.page - 3);
        return Positioned(
          top: topMargin(context) +
              (mainSquareSize(context) * (1 - animation.value)) +
              16 +
              32 +
              8 +
              40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '02:40 pm',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.lighterGrey,
            ),
          ),
        ),
      ),
    );
  }
}
