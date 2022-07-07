// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../configs/helper/colors.dart';
import '../../../configs/helper/constants.dart';
import '../../../configs/helper/helper.dart';
import '../../../home/presentation/pages/homeScreen.dart';
import '../widgets/searchBar.dart';
import '../widgets/menuCard.dart';
import '../widgets/menuHeader.dart';

String? validate(String? value) {
  return value!.isEmpty ? "Empty" : "";
}

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";

  MenuScreen({Key? key}) : super(key: key);
  final TextEditingController searchtextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  MenuHeader(),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchBar(
                    title: "Search Food",
                    controller: searchtextcontroller,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: Constants.height * 0.6,
                      width: Constants.width,
                      child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 100,
                            decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                color: AppColor.red),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                gestureFood(context),
                                const SizedBox(
                                  height: 20,
                                ),
                                gesturebeverage(context),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gestureFood(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              category: "Food",
            ),
          ),
        );
      },
      child: MenuCard(
        imageShape: ClipOval(
          child: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(
              Helper.getAssetName("western2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        name: "Food",
        count: "120",
      ),
    );
  }

  Widget gesturebeverage(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              category: "Beverage",
            ),
          ),
        );
      },
      child: MenuCard(
        imageShape: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(
              Helper.getAssetName("coffee2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        name: "Beverage",
        count: "220",
      ),
    );
  }
}
