import 'package:flutter/material.dart';
import 'package:plant/controller/plantsController.dart';
import 'package:plant/model/plantsModel.dart';

class MyTextFormField extends StatelessWidget {
  bool aktifMi = false;
  MyTextFormField({super.key, required this.aktifMi});
  PlantsController controller = PlantsController();
  TextEditingController searchController = TextEditingController();
  List<Plants> filteredPlants = [];

  void searchPlants(String query) {
    filteredPlants = controller.plantsList
        .where(
            (plant) => plant.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: TextFormField(
              controller: searchController,
              onChanged: (query) {
                searchPlants(query);
                aktifMi = true;
              },
              decoration: const InputDecoration(
                labelText: 'plants',
                hintText: 'example plant',
                prefixIcon: Icon(Icons.search),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      ],
    );
  }
}
