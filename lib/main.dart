import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/provider/favIconProvider.dart';
import 'package:plant/provider/onboardProvider.dart';
import 'package:plant/provider/plantProvider.dart';
import 'package:plant/view/onboardScreen/onboardImage.dart';
import 'package:plant/view/signup/signupView.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavIconProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlantProvider(),
        )
      ],
      child: const GetMaterialApp(
          debugShowCheckedModeBanner: false, home: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final userIsLoggedIn = snapshot.data;

          if (userIsLoggedIn!) {
            // Kullanıcı oturum açmışsa ana sayfayı gösterin
            return OnboardImage();
          } else {
            // Kullanıcı oturum açmamışsa oturum açma sayfasına yönlendirin
            return SignUpPage();
          }
        });
  }
}
