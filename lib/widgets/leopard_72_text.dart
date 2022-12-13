import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';

import '../utils/constants.dart';

class Leopard72Text extends StatelessWidget {
  const Leopard72Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetProvider>(
      builder: (context, provider, child) {
        return Transform.translate(
          offset: Offset(-50 - 0.5 * provider.offset, -30),
          child: child,
        );
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          width: mainSquareSize(context),
          child: const FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            child: Text(
              "72",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
