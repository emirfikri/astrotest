// ignore_for_file: prefer_const_constructors

import '../../helper/constants.dart';
import 'widgets/menuHeader.dart';
import 'package:flutter/material.dart';
import '../../helper/colors.dart';
import '../../helper/helper.dart';
import '../homescreen/homeScreen.dart';
import 'widgets/menuCard.dart';
import '../../globalWidgets/searchBar.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";

  const MenuScreen({Key? key}) : super(key: key);
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
                  SearchBar(title: "Search Food"),
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
                                GestureDetector(
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
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
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
                                ),
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
}
