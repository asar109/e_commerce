import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  set setIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
