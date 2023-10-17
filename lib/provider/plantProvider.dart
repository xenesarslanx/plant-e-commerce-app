import 'package:flutter/material.dart';
import 'package:plant/model/plantsModel.dart';

class PlantProvider with ChangeNotifier {
  List<Plants> plants = [];

  addPlant(data) {
    plants.add(data);
    notifyListeners();
  }

  void removeFromCart(data) {
    plants.remove(data);
    notifyListeners();
  }
}
