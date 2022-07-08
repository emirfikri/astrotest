// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../configs/helper/constants.dart';
import '../../../configs/helper/helper.dart';
import '../../home/home_page.dart';
import '../widgets/searchBar.dart';
import '../widgets/menuCard.dart';
import '../widgets/menuHeader.dart';

String? validate(String? value) {
  return value!.isEmpty ? "Empty" : "";
}

class MenuScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => MenuScreen(),
    );
  }

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
                                PushToHome(
                                  category: "Food",
                                  count: '120',
                                  image: Helper.getAssetName("western2.jpg"),
                                  name: 'Food',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                PushToHome(
                                  category: "Beverage",
                                  count: '220',
                                  image: Helper.getAssetName("coffee2.jpg"),
                                  name: 'Beverage',
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

class PushToHome extends StatelessWidget {
  final String category;
  final String image;
  final String name;
  final String count;
  const PushToHome({
    Key? key,
    required this.category,
    required this.image,
    required this.name,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          HomeScreen.route(
            category: category,
          ),
        );
      },
      child: MenuCard(
        imageShape: ClipOval(
          child: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(
              (image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        name: name,
        count: count,
      ),
    );
  }
}
