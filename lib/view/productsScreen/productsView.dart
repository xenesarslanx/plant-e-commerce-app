import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/constants/const.dart';
import 'package:plant/controller/plantsController.dart';
import 'package:plant/model/plantsModel.dart';
import 'package:plant/provider/favIconProvider.dart';
import 'package:plant/view/DetailsPage/productDetails.dart';
import 'package:provider/provider.dart';

class PlantProducts extends StatelessWidget {
  final PlantsController plantsController = PlantsController();

  PlantProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 sütunlu ızgara
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final plantData = plantsController.plantsList[index];
          return MyCardWidget(plantsData: plantData);
        },
        childCount: plantsController
            .plantsList.length, // Kaç tane 2'li öğe gösterileceğini belirtin
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  Plants plantsData;

  MyCardWidget({super.key, required this.plantsData});
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavIconProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: Get.height / 3,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: () {
            print(Get.height.toString());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  plantsData: plantsData,
                  isActive: true,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Image.asset(
                plantsData.imageList![0].toString(),
                height: Get.height / 10,
                width: 50,
              ),
              const SizedBox(height: 5),
              Constants().textMethod(plantsData.name.toString(), 20,
                  FontWeight.bold, Constants().boldGreen),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Constants().textMethod("${plantsData.price} TL ", 20,
                      FontWeight.bold, Constants().black),
                  InkWell(
                    onTap: () {
                      plantsData.isFav =
                          favProvider.iconReverse(plantsData.isFav);
                      print(plantsData.isFav);
                    },
                    child: Icon(
                      plantsData.isFav!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
