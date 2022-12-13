import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';
import 'package:travel_animation/utils/app_colors.dart';

import '../../utils/constants.dart';

class StartCampTimeText extends StatelessWidget {
  const StartCampTimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetProvider>(
      builder: (context, provider, child) {
        double opacity = math.max(0, 4 * provider.page - 3);
        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 16 + 32 + 40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          '02:40 pm',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColors.lighterGrey,
          ),
        ),
      ),
    );
  }
}
