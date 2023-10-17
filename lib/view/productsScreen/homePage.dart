import 'package:flutter/material.dart';
import 'package:plant/constants/const.dart';
import 'package:plant/utils/myTextField.dart';
import 'package:plant/view/productsScreen/productsView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  bool aktifMi = false;

  final prefs = SharedPreferences.getInstance();

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().scaffold,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  backgroundColor: Constants().scaffold,
                  pinned: true,
                  expandedHeight: 200,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [StretchMode.zoomBackground],
                    background: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text(""),
                                //Constants().textMethod(userProvider.users[0].email.toString(),
                                //    20, FontWeight.bold, Constants().black),
                              ),
                              FutureBuilder<SharedPreferences>(
                                  future: SharedPreferences.getInstance(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    final prefs = snapshot.data;
                                    final email =
                                        prefs!.getString('email') ?? 'N/A';

                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Constants().textMethod(
                                            "Email: $email",
                                            20,
                                            FontWeight.bold,
                                            Constants().black),
                                      ],
                                    );
                                  }),
                              const SizedBox(
                                width: 30,
                              ),
                              CircleAvatar(
                                maxRadius: 25,
                                minRadius: 10,
                                child: Image.asset("lib/assets/image2.png"),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: MyTextFormField(
                              aktifMi: false,
                            )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.filter_alt,
                                  size: 35,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                PlantProducts()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
