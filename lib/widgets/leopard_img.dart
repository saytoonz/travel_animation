import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';

class LeopardImage extends StatelessWidget {
  const LeopardImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetProvider, AnimationController>(
      builder: (context, provider, animation, child) {
        return Positioned(
          left: -0.85 * provider.offset,
          width: MediaQuery.of(context).size.width * 1.6,
          child: Transform.scale(
            scale: 1 - 0.1 * animation.value,
            child: Opacity(
              opacity: 1 - 0.6 * animation.value,
              child: child,
            ),
          ),
        );
      },
      child: IgnorePointer(
        child: Image.asset("assets/leopard.png"),
      ),
    );
  }
}
