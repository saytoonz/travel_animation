import 'package:flutter/material.dart';

class PageOffsetProvider extends ChangeNotifier {
  //Based on screen width
  double _offset = 0.0;
  //Based on pages
  double? _page = 0.0;

  PageOffsetProvider(PageController controller) {
    controller.addListener(() {
      _offset = controller.offset;
      _page = controller.page;
      notifyListeners();
    });
  }

  double get offset => _offset;
  double get page => _page ?? 0;
}
