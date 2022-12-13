import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/page_offset_provider.dart';
import '../utils/app_colors.dart';

class Indicators extends StatelessWidget {
  const Indicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      child: Consumer<PageOffsetProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: provider.page.round() == 0
                      ? AppColors.white
                      : AppColors.lighterGrey,
                  shape: BoxShape.circle,
                ),
                height: 7,
                width: 7,
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                decoration: BoxDecoration(
                  color: provider.page.round() != 0
                      ? AppColors.white
                      : AppColors.lighterGrey,
                  shape: BoxShape.circle,
                ),
                height: 7,
                width: 7,
              )
            ],
          );
        },
      ),
    );
  }
}
