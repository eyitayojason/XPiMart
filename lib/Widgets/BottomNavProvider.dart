import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class FavoritesProvider with ChangeNotifier {
  bool focus1 = false;
  bool focus2 = false;

  focusset() {
    focus1 = true;
    focus2 = false;

    notifyListeners();
  }

  focusset2() {
    focus2 = true;
    focus1 = false;
    notifyListeners();
  }
}
