import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../map_hider.dart';

class HorizontalDots extends StatelessWidget {
  const HorizontalDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetProvider, AnimationController>(
      builder: (context, provider, animation, child) {
        if (animation.value > 0.25) {
          return const SizedBox.shrink();
        }
        double spacer;
        double opacity;
        if (animation.value == 0) {
          spacer = math.max(0, 4 * provider.page - 3);
          opacity = spacer;
        } else {
          spacer = math.max(0, 1 - 6 * animation.value);
          opacity = 1;
        }

        return Positioned(
          top: dotsTopMargin(context),
          child: Opacity(
            opacity: opacity,
            child: MapHider(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 40 * spacer),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40 * spacer),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 9 * spacer),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 9 * spacer),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
