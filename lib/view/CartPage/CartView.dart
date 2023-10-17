import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/constants/const.dart';
import 'package:plant/controller/dbController.dart';
import 'package:plant/model/plantsModel.dart';
import 'package:plant/utils/dbHelper.dart';
import 'package:plant/utils/mySnackBar.dart';
import 'package:plant/view/CreditPage/creditCard.dart';
import 'package:plant/view/DetailsPage/productDetails.dart';

class CartView extends StatefulWidget {
  Plants plantsData;
  CartView({super.key, required this.plantsData});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  DBHelper dbHelper = DBHelper();

  DBController dbController = DBController();
  double sum = 0;

  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios))
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: dbController
                    .queryAll(), // getPlantData fonksiyonunu çağırın
                builder: (context, snapshot) {
                  print(snapshot.data);

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Hata durumunu ele alın
                      return const Text('Veri alınamadı.');
                    } else {
                      final plantData = snapshot.data; // Veriyi alın
                      double sumFunc() {
                        sum = 0;
                        for (int i = 0; i < plantData!.length; i++) {
                          sum += plantData[i].price!.toDouble();
                        }
                        return sum;
                      }

                      print(plantData!.length);
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: plantData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      height: 130,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.white,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                plantsData: widget.plantsData,
                                                isActive: false,
                                              ),
                                            ),
                                          );
                                        },
                                        onLongPress: () {
                                          // delete plant from cart
                                          setState(() {
                                            dbController.delete(
                                                plantData[index].id!.toInt());
                                            snackBar(
                                                "deleted",
                                                widget.plantsData.name
                                                    .toString());
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            /* Image.asset(
                                    liste0(plantData[index].imageList),
                                    height: 90,
                                    width: 50,
                                  ),*/
                                            const SizedBox(height: 5),
                                            Constants().textMethod(
                                                plantData[index]
                                                    .name
                                                    .toString(),
                                                20,
                                                FontWeight.bold,
                                                Constants().boldGreen),
                                            const SizedBox(height: 25),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Constants().textMethod(
                                                    "${plantData[index].price} TL ",
                                                    20,
                                                    FontWeight.bold,
                                                    Constants().black),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Constants().textMethod(
                                    "Total Price",
                                    25,
                                    FontWeight.bold,
                                    Constants().green,
                                  ),
                                  Text(sumFunc().toString()),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.to(CreditCardPage());
                                      },
                                      child: Constants().textMethod(
                                          "BUY",
                                          30,
                                          FontWeight.bold,
                                          Constants().boldGreen))
                                ],
                              ),
                            )
                          ]);
                    }
                  } else {
                    return const CircularProgressIndicator(); // Veri alınırken bir yüklenme göstergesi gösterin
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
