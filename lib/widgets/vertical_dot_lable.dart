import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/map_provider.dart';
import 'package:travel_animation/utils/app_colors.dart';

import '../utils/constants.dart';

class VultureIconLabel extends StatelessWidget {
  const VultureIconLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AnimationController, MapAnimationProvider>(
      builder: (context, animation, mapProvider, child) {
        double startTop =
            topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 4;
        double endTop = topMargin(context) + 32 + 16 + 8;
        double oneThird = (startTop - endTop) / 3;
        double opacity;
        if (animation.value < 2 / 3) {
          opacity = 0;
        } else if (mapProvider.value == 0) {
          opacity = 3 * (animation.value - 2 / 3);
        } else if (mapProvider.value < 0.33) {
          opacity = 1 - 3 * mapProvider.value;
        } else {
          opacity = 0;
        }

        return Positioned(
          top: endTop + 2 * oneThird - 28 - 16 - 7,
          right: 10 + opacity * 16,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const SmallAnimalIconLabel(
        isVulture: true,
        showLine: true,
      ),
    );
  }
}

class LeopardIconLabel extends StatelessWidget {
  const LeopardIconLabel({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer2<AnimationController, MapAnimationProvider>(
      builder: (context, animation, mapProvider, child) {
        double opacity;
        if (animation.value < 3 / 4) {
          opacity = 0;
        } else if (mapProvider.value == 0) {
          opacity = 4 * (animation.value - 3 / 4);
        } else if (mapProvider.value < 0.33) {
          opacity = 1 - 3 * mapProvider.value;
        } else {
          opacity = 0;
        }
        return Positioned(
          top: endTop(context) + oneThird(context) - 28 - 16 - 7,
          left: 10 + opacity * 16,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: SmallAnimalIconLabel(
        isVulture: false,
        showLine: true,
      ),
    );
  }
}

class SmallAnimalIconLabel extends StatelessWidget {
  final bool isVulture;
  final bool showLine;

  const SmallAnimalIconLabel({
    Key? key,
    required this.isVulture,
    required this.showLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (showLine && isVulture)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 16,
            height: 1,
            color: AppColors.white,
          ),
        const SizedBox(width: 24),
        Column(
          children: <Widget>[
            Image.asset(
              isVulture ? 'assets/vultures.png' : 'assets/leopards.png',
              width: 28,
              height: 28,
            ),
            SizedBox(height: showLine ? 16 : 0),
            Text(
              isVulture ? 'Vultures' : 'Leopards',
              style: TextStyle(fontSize: showLine ? 14 : 12),
            )
          ],
        ),
        const SizedBox(width: 24),
        if (showLine && !isVulture)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 16,
            height: 1,
            color: AppColors.white,
          ),
      ],
    );
  }
}
