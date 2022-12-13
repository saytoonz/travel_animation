import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';

import '../../utils/app_colors.dart';

class BirdCircle extends StatelessWidget {
  const BirdCircle({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 180),
      child: Consumer2<PageOffsetProvider, AnimationController>(
        builder: (context, provider, animation, child) {
          double multiplier;
          if (animation.value == 0) {
            multiplier = math.max(0, (4 * provider.page) - 3);
          } else {
            multiplier = math.max(0, 1 - (4 * animation.value));
          }

          double size = MediaQuery.of(context).size.width * 0.5 * multiplier;
          return Center(
            child: Container(
              height: size,
              width: size,
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
        // child: ,
      ),
    );
  }
}
