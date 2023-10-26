import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteProvider extends ChangeNotifier {
  // 1
  final _favoriteBox = Hive.box('fav_box');

  // 2
  List<dynamic> get favorites => _favoriteBox.values.toList();

  // 3
  void addFavorite(Map<dynamic, String> map) {
    _favoriteBox.add(map);
    notifyListeners();
  }

  // 4
  void removeFavorite(String id) {
    _favoriteBox.values.toList().forEach((element) {
      if (element['id'] == id) {
        _favoriteBox.deleteAt(_favoriteBox.values.toList().indexOf(element));
      }
    });
    notifyListeners();
  }

  // 5
  bool isFavorite(String id) {
    final exist =
        _favoriteBox.values.toList().any((element) => element['id'] == id);
    return exist;
  }
}
