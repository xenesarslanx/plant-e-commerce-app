import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/constants/const.dart';
import 'package:plant/view/onboardScreen/onboardImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpPage({super.key});
  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text);
    prefs.setString('password', passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/plantBackGround.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Constants().textMethod(
              "PLANTS APP", 40, FontWeight.bold, Constants().boldGreen),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: TextFormField(
                  controller: emailController,
                  onChanged: (query) {},
                  decoration: const InputDecoration(
                    labelText: 'email',
                    hintText: 'example@gmail.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black, width: 4.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: TextFormField(
                  controller: passwordController,
                  onChanged: (query) {},
                  decoration: const InputDecoration(
                    labelText: 'password',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black, width: 4.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: InkWell(
                  onTap: () async {
                    /*  _dbController.insertUser(emailController.text, passwordController.text);
                  Map<String, dynamic> userMap= {
                    'username': emailController.text,
                    'password': passwordController.text,
                  };
                  UserModel.fromMap(userMap);*/

                    await saveUserData(); //shared preferences
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isLoggedIn', true);
                    Get.off(OnboardImage());
                  },
                  child: Container(
                    height: 80,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Constants().green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text("Sign Up")),
                  ),
                ),
              )
            ],
          ),
        ]),
      )),
    );
  }
}
