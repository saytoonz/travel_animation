import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/page_offset_provider.dart';
import '../utils/app_colors.dart';

class ShareIcon extends StatelessWidget {
  const ShareIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 18,
      right: 24,
      child: Consumer<PageOffsetProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          return const Icon(
            Icons.share,
            size: 28,
            color: AppColors.white,
          );
        },
      ),
    );
  }
}
