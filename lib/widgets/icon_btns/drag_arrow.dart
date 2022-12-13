import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class DragArrow extends StatelessWidget {
  const DragArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          top: topMargin(context) -
              30 +
              (mainSquareSize(context) + 28) * (1 - animation.value),
          right: 24,
          child: Transform.rotate(
            angle: math.pi * (10 * animation.value) > math.pi
                ? math.pi
                : math.pi * (10 * animation.value),
            child: const Icon(
              Icons.keyboard_arrow_up,
              size: 28,
              color: AppColors.lighterGrey,
            ),
          ),
        );
      },
    );
  }
}
