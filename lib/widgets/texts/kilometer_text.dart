import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';
import 'package:travel_animation/utils/app_colors.dart';
import 'package:travel_animation/utils/constants.dart';

import '../map_hider.dart';

class KilometerText extends StatelessWidget {
  const KilometerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetProvider>(
      builder: (context, provider, child) {
        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 8 + 16 + 32 + 40,
          width: MediaQuery.of(context).size.width / 3,
          child: Opacity(
            opacity: math.max(0, 4 * provider.page - 3),
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "72 km.",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
