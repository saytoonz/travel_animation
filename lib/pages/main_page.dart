import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_animation/pages/leopard_page.dart';
import 'package:travel_animation/providers/page_offset_provider.dart';
import 'package:travel_animation/utils/app_colors.dart';
import 'package:travel_animation/utils/constants.dart';
import 'package:travel_animation/widgets/shapes/bird_head_circle.dart';
import 'package:travel_animation/widgets/on_map_btn.dart';
import 'package:travel_animation/widgets/texts/base_camp_text.dart';
import 'package:travel_animation/widgets/texts/kilometer_text.dart';
import 'package:travel_animation/widgets/texts/start_camp_time_text.dart';

import '../widgets/images/bird_img.dart';
import '../widgets/icon_btns/drag_arrow.dart';
import '../widgets/shapes/horizontal_dots.dart';
import '../widgets/shapes/indicators.dart';
import '../widgets/images/leopard_img.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/icon_btns/share_icon.dart';
import '../widgets/texts/base_camp_time_text.dart';
import '../widgets/texts/start_camp_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  AnimationController? _animationController;
  double get maxHeight => mainSquareSize(context) + 32 + 24;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  _handleDragUpdate(DragUpdateDetails details) {
    _animationController!.value -= (details.primaryDelta! / maxHeight);
  }

  _handleDragEnd(DragEndDetails details) {
    if (_animationController!.isAnimating ||
        _animationController!.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0) {
      _animationController!.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _animationController!.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      _animationController!
          .fling(velocity: _animationController!.value < 0.5 ? -2.0 : 2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageOffsetProvider(_pageController),
      child: ListenableProvider.value(
        value: _animationController,
        child: Scaffold(
          body: SafeArea(
              child: GestureDetector(
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  children: const [
                    LeopardPage(),
                    BirdCircle(),
                  ],
                ),
                const CustomAppBar(),
                const LeopardImage(),
                const BirdImage(),
                const Indicators(),
                const DragArrow(),
                const ShareIcon(),
                OnMapBtn(animController: _animationController),
                const HorizontalDots(),
                const StartCampTimeText(),
                const StartCampText(),
                const BaseCampText(),
                const BaseCampTimeText(),
                const KilometerText(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
