import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteProvider  extends ChangeNotifier{ 

  // 1
  final _favoriteBox = Hive.box('fav_box');

  // 2
  List<dynamic> get favorites => _favoriteBox.values.toList();

  // 3
  void addFavorite(String id) {
     _favoriteBox.put(id, id);
    notifyListeners();
  }

  // 4
  void removeFavorite(String id) {
    _favoriteBox.delete(id);
    notifyListeners();
  }

  // 5
  bool isFavorite(String id) {
    return _favoriteBox.containsKey(id);
  }
}