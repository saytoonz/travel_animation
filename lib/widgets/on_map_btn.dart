import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/map_provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';
import 'package:travel_animation/utils/app_colors.dart';

class OnMapBtn extends StatelessWidget {
  const OnMapBtn({super.key});
  // final AnimationController? animController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 4,
      child: Consumer2<PageOffsetProvider, AnimationController>(
        builder: (context, provider, animation, child) {
          return Opacity(
            opacity: math.max(0, 4 * provider.page - 3),
            child: TextButton(
              onPressed: () {
                final provider =
                    Provider.of<MapAnimationProvider>(context, listen: false);
                provider.value == 0 ? provider.forward() : provider.reverse();
              },
              child: const Text(
                "ON MAP",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
