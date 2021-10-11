import 'package:flutter/material.dart';

class ScrollOffsetNotifier extends ChangeNotifier {
  double scrollOffSet = 0.0;
  int index = 0;

  void setOffSet(double offset) {
    scrollOffSet = offset;
    notifyListeners();
  }

  void setIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
