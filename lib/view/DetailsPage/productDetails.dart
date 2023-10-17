// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plant/constants/const.dart';
import 'package:plant/model/plantsModel.dart';
import 'package:plant/utils/myCard.dart';
import 'package:plant/view/CartPage/CartView.dart';

class ProductDetails extends StatelessWidget {
  Plants plantsData;
  bool isActive;
  ProductDetails({
    Key? key,
    required this.plantsData,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              isActive
                  ? IconButton(
                      onPressed: () {
                        Get.to(CartView(
                          plantsData: plantsData,
                        ));
                      },
                      icon: const Icon(Icons.shopping_cart),
                    )
                  : const SizedBox(),
            ]),
            Expanded(
              child: PageView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  print(
                    plantsData.imageList!.length,
                  );
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: plantsData.imageList!.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                                plantsData.imageList![index].toString());
                          },
                        ),
                      ),
                      Constants().textMethod(plantsData.name.toString(), 25,
                          FontWeight.bold, Constants().black),
                      const SizedBox(
                        height: 10,
                      ),
                      Constants().textMethod(plantsData.description.toString(),
                          20, FontWeight.normal, Constants().grey),
                      const SizedBox(
                        height: 20,
                      ),
                      //card
                      cardMethod(plantsData, context)
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
