import 'package:flutter/foundation.dart';
import 'package:plant/controller/onboardController.dart';

class OnboardingProvider with ChangeNotifier {
  OnboardController onboardController = OnboardController();

  int currentPageIndex = 0;

  void nextPage() {
    if (currentPageIndex < onboardController.onboardingDatas.length - 1) {
      currentPageIndex++;
      notifyListeners();
    }
  }
}
