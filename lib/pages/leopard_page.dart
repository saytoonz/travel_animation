import 'package:flutter/material.dart';
import 'package:travel_animation/utils/constants.dart';

import '../widgets/texts/leopard_72_text.dart';
import '../widgets/texts/leopard_desc_title.dart';

class LeopardPage extends StatelessWidget {
  const LeopardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: topMargin(context)),
        const Leopard72Text(),
        const SizedBox(height: 32),
        const LeopardDescTitle(),
        const SizedBox(height: 32),
        const LeopardDesc(),
      ],
    );
  }
}
