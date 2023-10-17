import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant/constants/const.dart';
import 'package:plant/controller/onboardController.dart';
import 'package:plant/model/onboardModel.dart';
import 'package:plant/provider/onboardProvider.dart';
import 'package:plant/view/productsScreen/homePage.dart';
import 'package:provider/provider.dart';

class OnboardImage extends StatelessWidget {
  OnboardController onboardController = OnboardController();

  OnboardImage({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    int currentIndex = onboardingProvider.currentPageIndex;
    final onboardingData = onboardingProvider.onboardController.onboardingDatas;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.italiana(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Constants().black),
                    ))
              ],
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  currentIndex = index;
                  print(currentIndex);
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final data = onboardingData;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        data[index].image.toString(),
                        width: 240,
                        height: 250,
                      ),
                      Tabbar(data: data, currentPage: index), //sekme çubuğu
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          data[index].description.toString(),
                          style: GoogleFonts.italiana(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      /*ElevatedButton(
                        onPressed: () {
                         
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Icon(
                          Icons.forward,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),*/
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

class Tabbar extends StatelessWidget {
  Tabbar({
    super.key,
    required this.data,
    required this.currentPage,
  });

  List<OnboardModel> data;
  int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(data.length, (index) {
        return Container(
          margin: const EdgeInsets.all(5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentPage ? Constants().green : Constants().grey,
          ),
        );
      }),
    );
  }
}
