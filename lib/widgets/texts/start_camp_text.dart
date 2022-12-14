import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';
import 'package:travel_animation/utils/app_colors.dart';
import 'package:travel_animation/utils/constants.dart';

import '../map_hider.dart';

class StartCampText extends StatelessWidget {
  const StartCampText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetProvider>(
      builder: (context, provider, child) {
        double opacity = math.max(0, (4 * provider.page) - 3);

        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 8 + 16 + 32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Start Camp",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
