import 'package:flutter/material.dart';

class FavIconProvider with ChangeNotifier {
  bool isFavorite = false;

  iconReverse(var data) {
    isFavorite = !isFavorite;
    var data = isFavorite;
    notifyListeners();
    return data;
  }
}
