import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activepage = 0;

  get activepage => _activepage;

  set setActivePage(int newIndex) {
    _activepage = newIndex;
    notifyListeners();
  }
}
