import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';

import '../utils/app_colors.dart';

class LeopardDescTitle extends StatelessWidget {
  const LeopardDescTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * provider.page),
          child: child,
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 24.0),
        child: Text(
          'Travel description',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class LeopardDesc extends StatelessWidget {
  const LeopardDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * provider.page),
          child: child,
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        child: Text(
          'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.lighterGrey,
          ),
        ),
      ),
    );
  }
}
