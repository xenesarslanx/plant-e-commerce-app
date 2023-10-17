import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/constants/const.dart';
import 'package:plant/controller/dbController.dart';
import 'package:plant/model/plantsModel.dart';
import 'package:plant/provider/plantProvider.dart';
import 'package:plant/utils/mySnackBar.dart';
import 'package:provider/provider.dart';

Padding cardMethod(Plants plantsData, context) {
  final plantProvider = Provider.of<PlantProvider>(context);
  DBController dbController = DBController();
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8),
    child: Column(
      children: [
        Container(
          height: Get.height / 4,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Constants().boldGreen,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const Icon(Icons.height),
                    Text("Height: ${plantsData.size}"),
                    const SizedBox(
                      width: 25,
                    ),
                    const Icon(Icons.thermostat),
                    const Text("Temparature: 25 C"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text("Total Price"),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("${plantsData.price} TL"),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        plantProvider.plants.add(plantsData);
                        dbController.insert(
                          plantsData.name.toString(),
                          plantsData.id!.toInt(),
                          plantsData.price!.toDouble(),
                          plantsData.imageList!,
                          plantsData.isFav!,
                          plantsData.size.toString(),
                          plantsData.description.toString(),
                        ); //sqflite
                        snackBar("Added", "${plantsData.name}");
                        for (int i = 0; i < plantProvider.plants.length; i++) {
                          print(plantProvider.plants[i].name);
                        }
                      },
                      child: Container(
                        height: Get.height / 10,
                        width: Get.width / 2,
                        decoration: BoxDecoration(
                            color: Constants().green,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(child: Text("Add to Cart")),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
