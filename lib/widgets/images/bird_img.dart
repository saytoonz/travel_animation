import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';

class BirdImage extends StatelessWidget {
  const BirdImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetProvider, AnimationController>(
      builder: (context, provider, animation, child) {
        return Positioned(
          left:
              1.2 * MediaQuery.of(context).size.width - 0.85 * provider.offset,
          child: Transform.scale(
            scale: 1 - .1 * animation.value,
            child: Opacity(
              opacity: 1 - .6 * animation.value,
              child: child!,
            ),
          ),
        );
      },
      child: IgnorePointer(
        child: Image.asset(
          "assets/vulture.png",
          width: MediaQuery.of(context).size.width / 3,
        ),
      ),
    );
  }
}
